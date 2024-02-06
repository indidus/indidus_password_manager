use serde_json::{Number, Value};
use sqlx::{query::QueryAs, query_as, sqlite::SqliteArguments, Database, FromRow, Sqlite};

use structs::HttpQuery;
pub struct SqlQueryBuilder {
    pub table: String,
    pub query: HttpQuery,
    pub params: Vec<Value>,
    pub is_analytic: bool,
    pub is_filtered: bool,
}

// SELECT [fields] FROM [table] [WHERE filters] [groups] [orders] LIMIT [limit] OFFSET [offset]
// fields: [field1 as new_name1, field2, field3, ...] || [COUNT(field1) AS count_field1, SUM(field2) sum_field2, ...] || *
// filters: WHERE field1 = ? AND field2 < ? OR field3 = ?
// groups: GROUP BY field1, field2, ...
// orders: ORDER BY field1 ASC, field2 DESC
// limit: LIMIT ?
// offset: OFFSET ?

impl SqlQueryBuilder {
    pub fn new(table: String, query: HttpQuery) -> SqlQueryBuilder {
        SqlQueryBuilder {
            table: table,
            query: query.clone(),
            params: Vec::new(),
            is_analytic: query.to_owned().aggregates.is_some(),
            is_filtered: query.to_owned().filters.clone().is_some(),
        }
    }

    fn get_select_string(&self) -> String {
        let mut select_string = String::from("SELECT ");
        let mut fields: Vec<String> = vec![];

        if self.is_analytic {
            for agg in self.query.aggregates.as_ref().unwrap() {
                format!("{}", agg);
            }
        } else if self.query.select.is_some() {
            for select in self.query.select.as_ref().unwrap() {
                fields.push(format!("{}", select));
            }
        } else {
            fields.push(String::from("*"));
        }

        select_string.push_str(&fields.join(", "));
        select_string
    }

    fn get_filter_string(&mut self, filter: structs::Filter, index: i32) -> String {
        let mut filter_string = String::new();

        if index > 0 {
            if filter.glue.is_some() {
                filter_string.push_str(&format!("{} ", filter.glue.as_ref().unwrap()));
            } else {
                filter_string.push_str(&format!("{} ", structs::Glue::And));
            }
        }

        filter_string.push_str(&format!("{} {} ", filter.column, filter.operator));

        if filter.operator == structs::FilterOperator::IsNull
            || filter.operator == structs::FilterOperator::IsNotNull
        {
            return filter_string;
        }

        if filter.operator == structs::FilterOperator::In
            || filter.operator == structs::FilterOperator::NotIn
        {
            if filter.values.is_some() {
                let mut placeholders: Vec<String> = vec![];

                for value in filter.values.as_ref().unwrap() {
                    placeholders.push(String::from("?"));
                    self.params.push(value.clone());
                }

                filter_string.push_str(&format!("({})", placeholders.join(", ")));
            } else {
                // TODO: throw error
            }
            return filter_string;
        }

        filter_string.push_str("?");
        match filter.operator {
            structs::FilterOperator::Like => {
                self.params.push(Value::String(format!(
                    "\"%{}%\"",
                    filter.value.unwrap().clone()
                )));
            }
            structs::FilterOperator::NotLike => {
                self.params.push(Value::String(format!(
                    "%{}%",
                    filter.value.unwrap().clone()
                )));
            }
            structs::FilterOperator::StartsWith => {
                self.params
                    .push(Value::String(format!("{}%", filter.value.unwrap().clone())));
            }
            structs::FilterOperator::EndsWith => {
                self.params
                    .push(Value::String(format!("%{}", filter.value.unwrap().clone())));
            }
            _ => {
                self.params.push(filter.value.unwrap().clone());
            }
        }

        filter_string
    }

    fn get_where_string(&mut self) -> String {
        if !self.query.filters.is_some() {
            return String::from("");
        }
        let mut filters: Vec<String> = vec![];

        if self.query.filters.is_some() {
            let mut index = 0;
            for filter in self.query.filters.clone().unwrap() {
                filters.push(self.get_filter_string(filter, index));
                index += 1;
            }
        }
        let where_string = format!("WHERE {}", filters.join(", "));
        where_string
    }

    fn build_sqlite_query(&mut self) -> (std::string::String, Vec<Value>) {
        let select = self.get_select_string();
        let where_string = self.get_where_string();
        let mut select_query = format!("{} FROM {} {}", select, self.table, where_string);
        if self.query.groups.is_some() {
            let mut groups: Vec<String> = vec![];
            for group in self.query.groups.clone().unwrap() {
                groups.push(format!("{}", group));
            }
            select_query.push_str(&format!(" GROUP BY {}", groups.join(", ")));
        }
        if self.query.orders.is_some() {
            let mut orders: Vec<String> = vec![];
            for order in self.query.orders.clone().unwrap() {
                orders.push(format!("{}", order));
            }
            select_query.push_str(&format!(" ORDER BY {}", orders.join(", ")));
        }
        if self.query.limit.is_some() {
            select_query.push_str(&format!(" LIMIT ?"));
            self.params
                .push(Value::Number(Number::from(self.query.limit.unwrap())));
        }
        if self.query.offset.is_some() {
            select_query.push_str(&format!(" OFFSET ?"));
            self.params
                .push(Value::Number(Number::from(self.query.offset.unwrap())));
        }

        (select_query, self.params.clone())
    }

    fn bind_values<'q, DB: Database, O>(
        mut query: QueryAs<'q, Sqlite, O, SqliteArguments<'q>>,
        values: Vec<serde_json::Value>,
    ) -> QueryAs<'q, Sqlite, O, SqliteArguments<'q>> {
        for value in values {
            match value {
                serde_json::Value::Null => {
                    query = query.bind::<Option<String>>(None);
                }
                serde_json::Value::Bool(v) => {
                    query = query.bind(v);
                }
                serde_json::Value::Number(v) => {
                    if v.is_f64() {
                        query = query.bind(v.as_f64());
                    } else if v.is_i64() {
                        query = query.bind(v.as_i64());
                    } else if v.is_u64() {
                        match v.as_u64() {
                            Some(u) => {
                                query = query.bind(u as f64);
                            }
                            None => {
                                query = query.bind::<Option<i64>>(None);
                            }
                        }
                    }
                }
                serde_json::Value::String(v) => {
                    query = query.bind(v);
                }
                serde_json::Value::Array(_) => {}
                serde_json::Value::Object(_) => {}
            }
        }
        query
    }

    pub async fn fetch_all<'e, O, E>(&mut self, executor: E) -> Vec<O>
    where
        O: Send + Unpin + for<'r> FromRow<'r, <Sqlite as sqlx::Database>::Row>,
        E: sqlx::SqliteExecutor<'e>,
    {
        let (sql, params) = self.build_sqlite_query();
        let query: QueryAs<'_, Sqlite, O, SqliteArguments> = query_as(sql.as_str());
        let query: QueryAs<'_, Sqlite, O, SqliteArguments<'_>> =
            Self::bind_values::<Sqlite, O>(query, params);
        query.fetch_all(executor).await.unwrap()
    }
}
