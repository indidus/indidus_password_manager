use std::fmt::Display;

use serde::Deserialize;
use serde::Serialize;
use serde_json::Value;

#[derive(serde::Deserialize)]
pub struct FIlterParam {
    pub filter: String,
}

pub struct Settings {
    pub db_path: String,
    pub db_file: String,
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct HttpQuery {
    // pub table: Option<String>,
    pub select: Option<Vec<Select>>,
    pub filters: Option<Vec<Filter>>,
    pub orders: Option<Vec<OrderBy>>,
    pub aggregates: Option<Vec<Aggregate>>,
    pub groups: Option<Vec<Group>>,
    pub limit: Option<i64>,
    pub offset: Option<i64>,
    // pub last_id: Option<String>,
    // pub distinct: Option<bool>,
    // pub joins: Option<Vec<Join>>,
    // pub having: Option<Vec<Filter>>,
    // pub union: Option<Vec<HttpQuery>>,
    // pub intersect: Option<Vec<HttpQuery>>,
    // pub except: Option<Vec<HttpQuery>>,
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Select {
    pub column: String,
    pub alias: Option<String>,
    // pub functions: Option<Vec<Function>>,
    // pub filters: Option<Vec<Filter>>,
    // pub table: Option<String>,
    // pub select: Option<Vec<Select>>,
}

impl Display for Select {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match &self.alias {
            Some(alias) => write!(f, "{} AS {}", self.column, alias),
            None => write!(f, "{}", self.column),
        }
    }
}

// #[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
// pub struct Function {
//     pub name: String,
//     pub args: Option<Vec<String>>,
// }

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Filter {
    pub column: String,
    pub operator: FilterOperator,
    pub value: Option<Value>,
    pub values: Option<Vec<Value>>,
    pub glue: Option<Glue>,
}

// impl Display for Filter {
//     fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
//         match &self.glue {
//             Some(glue) => write!(
//                 f,
//                 "{} {} {} {}",
//                 glue, self.column, self.operator, self.value
//             ),
//             None => write!(f, "{} {} {}", self.column, self.operator, self.value),
//         }
//     }
// }

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum FilterOperator {
    #[default]
    Eq,
    Ne,
    Gt,
    Ng,
    Lt,
    Nl,
    Ge,
    Le,
    Like,
    StartsWith,
    EndsWith,
    NotLike,
    In,
    NotIn,
    IsNull,
    IsNotNull,
}

impl Display for FilterOperator {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            FilterOperator::Eq => write!(f, "="),
            FilterOperator::Ne => write!(f, "<>"),
            FilterOperator::Gt => write!(f, ">"),
            FilterOperator::Ng => write!(f, "!>"),
            FilterOperator::Lt => write!(f, "<"),
            FilterOperator::Nl => write!(f, "!<"),
            FilterOperator::Ge => write!(f, ">="),
            FilterOperator::Le => write!(f, "<="),
            FilterOperator::Like => write!(f, "LIKE"),
            FilterOperator::StartsWith => write!(f, "LIKE"),
            FilterOperator::EndsWith => write!(f, "LIKE"),
            FilterOperator::NotLike => write!(f, "NOT LIKE"),
            FilterOperator::In => write!(f, "IN"),
            FilterOperator::NotIn => write!(f, "NOT IN"),
            FilterOperator::IsNull => write!(f, "IS NULL"),
            FilterOperator::IsNotNull => write!(f, "IS NOT NULL"),
        }
    }
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum Glue {
    #[default]
    And,
    Or,
    Not,
}

impl Display for Glue {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Glue::And => write!(f, "AND"),
            Glue::Or => write!(f, "OR"),
            Glue::Not => write!(f, "NOT"),
        }
    }
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct OrderBy {
    pub column: String,
    pub direction: OrderByDirection,
}

impl Display for OrderBy {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self.direction {
            OrderByDirection::Asc => write!(f, "{} ASC", self.column),
            OrderByDirection::Desc => write!(f, "{} DESC", self.column),
        }
    }
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum OrderByDirection {
    #[default]
    Asc,
    Desc,
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Aggregate {
    pub operation: AggregateOperation,
    pub column: String,
    pub alias: Option<String>,
}

impl Display for Aggregate {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match &self.alias {
            Some(alias) => write!(f, "{}({}) AS {}", self.operation, self.column, alias),
            None => write!(f, "{}({})", self.operation, self.column),
        }
    }
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum AggregateOperation {
    #[default]
    Count,
    Sum,
    Avg,
    Min,
    Max,
}

impl Display for AggregateOperation {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            AggregateOperation::Count => write!(f, "COUNT"),
            AggregateOperation::Sum => write!(f, "SUM"),
            AggregateOperation::Avg => write!(f, "AVG"),
            AggregateOperation::Min => write!(f, "MIN"),
            AggregateOperation::Max => write!(f, "MAX"),
        }
    }
}

#[derive(Default, Debug, Clone, PartialEq, Serialize, Deserialize)]
pub struct Group {
    pub column: String,
    pub alias: Option<String>,
}

impl Display for Group {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match &self.alias {
            Some(alias) => write!(f, "{} AS {}", self.column, alias),
            None => write!(f, "{}", self.column),
        }
    }
}
