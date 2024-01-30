mod tests;
use proc_macro2::{Ident, TokenStream};
use quote::{format_ident, quote, ToTokens};
use syn::{parse2, Expr, ItemStruct};

struct CrudlfField {
    struct_field_name: String,
    db_field_name: String,
    // is_optional: bool,
    select_query: String,
}

pub fn crudlf_insert(input: TokenStream) -> TokenStream {
    let input: ItemStruct = match parse2::<ItemStruct>(input) {
        Ok(syntax_tree) => syntax_tree,
        Err(error) => return error.to_compile_error(),
    };

    let name = input.ident.clone();

    let db_fields: Vec<CrudlfField> = input
        .fields
        .iter()
        .map(|field| get_db_field_name(field))
        .collect();

    let db_fields_names: Vec<String> = db_fields
        .iter()
        .map(|field| field.db_field_name.clone())
        .collect::<Vec<String>>();

    let struct_fields_names: Vec<Ident> = db_fields
        .iter()
        .map(|field| format_ident!("{}", field.struct_field_name.clone()))
        .collect::<Vec<Ident>>();

    let db_return_fields = db_fields
        .iter()
        .map(|field| field.select_query.clone())
        .collect::<Vec<String>>()
        .join(", ");

    let db_insert_fields: String = db_fields_names.join(", ");
    let db_field_placeholders: String = get_db_field_placeholders(db_fields_names.clone());
    let db_table_name: String = get_db_table_name(input.clone());
    let query = format!(
        "insert into {} ({}) values ({}) returning {}",
        db_table_name, db_insert_fields, db_field_placeholders, db_return_fields
    );

    let t = TokenStream::from(quote! {

        impl #name {

            // pub fn new(#(#struct_fields_names: #name),*) -> Self {
            //     Self {
            //         #(#struct_fields_names),*
            //     }
            // }

            pub async fn insert(mut data: #name) -> Option<#name> {
                let txn: sqlx::Pool<sqlx::Sqlite> = sqlite_wrapper::get_sqlite_pool().await;
                let mut txn = txn.begin().await.unwrap();

                let id = utils::get_ulid();
                data.id = Some(id);

                let data = data.sqlite_insert(&mut txn).await.unwrap();

                txn.commit().await.unwrap();

                Some(data)
            }

            async fn sqlite_insert<'e>(
                &self,
                txn: &mut sqlx::Transaction<'e, sqlx::Sqlite>,
            ) -> Result<#name, sqlx::Error>
            {
                sqlx::query_as!(
                    #name,
                    #query,
                    #(
                        self.#struct_fields_names
                    ),*
                )
                .fetch_one(&mut **txn)
                .await
            }
        }
    });
    t
}

pub fn crudlf_update(input: TokenStream) -> TokenStream {
    let input: ItemStruct = match parse2::<ItemStruct>(input) {
        Ok(syntax_tree) => syntax_tree,
        Err(error) => return error.to_compile_error(),
    };

    let name = input.ident.clone();

    let db_fields: Vec<CrudlfField> = input
        .fields
        .iter()
        .map(|field| get_db_field_name(field))
        .collect();

    let db_fields_names: Vec<String> = db_fields
        .iter()
        .filter(|field| field.db_field_name != "id")
        .map(|field| field.db_field_name.clone())
        .collect::<Vec<String>>();

    let struct_fields_names: Vec<Ident> = db_fields
        .iter()
        .filter(|field| field.db_field_name != "id")
        .map(|field| format_ident!("{}", field.struct_field_name.clone()))
        .collect::<Vec<Ident>>();

    let db_return_fields = db_fields
        .iter()
        .map(|field| field.select_query.clone())
        .collect::<Vec<String>>()
        .join(", ");

    let mut db_update_fields: String = db_fields_names.join(" = ?, ");
    db_update_fields.push_str(" = ?");
    let db_table_name: String = get_db_table_name(input.clone());
    let query = format!(
        "update {} set {} where id = ? returning {}",
        db_table_name, db_update_fields, db_return_fields
    );

    let t = TokenStream::from(quote! {

        impl #name {


            pub async fn update(id: String, mut data: #name) -> Option<#name> {
                let txn: sqlx::Pool<sqlx::Sqlite> = sqlite_wrapper::get_sqlite_pool().await;
                let mut txn = txn.begin().await.unwrap();

                data.id = Some(id);
                let data = data.sqlite_update(&mut txn).await.unwrap();
                txn.commit().await.unwrap();

                Some(data)
            }

            async fn sqlite_update<'e>(
                &self,
                txn: &mut sqlx::Transaction<'e, sqlx::Sqlite>,
            ) -> Result<#name, sqlx::Error>
            {
                sqlx::query_as!(
                    #name,
                    #query,
                    #(
                        self.#struct_fields_names
                    ),*,
                    self.id
                )
                .fetch_one(&mut **txn)
                .await
            }
        }
    });
    t
}

pub fn crudlf_select(input: TokenStream) -> TokenStream {
    let input: ItemStruct = match parse2::<ItemStruct>(input) {
        Ok(syntax_tree) => syntax_tree,
        Err(error) => return error.to_compile_error(),
    };

    let name = input.ident.clone();

    let db_fields: Vec<CrudlfField> = input
        .fields
        .iter()
        .map(|field| get_db_field_name(field))
        .collect();

    let db_return_fields = db_fields
        .iter()
        .map(|field| field.select_query.clone())
        .collect::<Vec<String>>()
        .join(", ");

    let db_table_name: String = get_db_table_name(input.clone());
    let query = format!(
        "select {} from {} where id = ?",
        db_return_fields, db_table_name
    );

    let t = TokenStream::from(quote! {

        impl #name {

            pub async fn get(id: String) -> Option<#name> {
                let txn: sqlx::Pool<sqlx::Sqlite> = sqlite_wrapper::get_sqlite_pool().await;
                let mut txn = txn.begin().await.unwrap();

                let data = #name::sqlite_select(&mut txn, id).await.unwrap();

                txn.commit().await.unwrap();

                Some(data)
            }

            async fn sqlite_select<'e>(
                txn: &mut sqlx::Transaction<'e, sqlx::Sqlite>,
                id: String,
            ) -> Result<#name, sqlx::Error>
            {
                sqlx::query_as!(
                    #name,
                    #query,
                    id,
                )
                .fetch_one(&mut **txn)
                .await
            }
        }
    });
    t
}

pub fn crudlf_delete(input: TokenStream) -> TokenStream {
    let input: ItemStruct = match parse2::<ItemStruct>(input) {
        Ok(syntax_tree) => syntax_tree,
        Err(error) => return error.to_compile_error(),
    };

    let name = input.ident.clone();

    let db_fields: Vec<CrudlfField> = input
        .fields
        .iter()
        .map(|field| get_db_field_name(field))
        .collect();

    let db_return_fields = db_fields
        .iter()
        .map(|field| field.select_query.clone())
        .collect::<Vec<String>>()
        .join(", ");

    let db_table_name: String = get_db_table_name(input.clone());
    let query = format!(
        "delete from {} where id = ? returning {}",
        db_table_name, db_return_fields
    );

    let t = TokenStream::from(quote! {

        impl #name {

            pub async fn delete(id: String) -> Option<#name> {
                let txn: sqlx::Pool<sqlx::Sqlite> = sqlite_wrapper::get_sqlite_pool().await;

                let mut txn = txn.begin().await.unwrap();
                let data = #name::sqlite_delete(&mut txn, id).await.unwrap();

                txn.commit().await.unwrap();

                Some(data)
            }

            async fn sqlite_delete<'e>(
                txn: &mut sqlx::Transaction<'e, sqlx::Sqlite>,
                id: String
            ) -> Result<#name, sqlx::Error>
            {
                sqlx::query_as!(
                    #name,
                    #query,
                    id,
                )
                .fetch_one(&mut **txn)
                .await
            }
        }
    });
    t
}

pub fn crudlf_list_filert(input: TokenStream) -> TokenStream {
    let input: ItemStruct = match parse2::<ItemStruct>(input) {
        Ok(syntax_tree) => syntax_tree,
        Err(error) => return error.to_compile_error(),
    };

    let name = input.ident.clone();

    let db_table_name: String = get_db_table_name(input.clone());

    let t = TokenStream::from(quote! {

        impl #name {


            pub async fn get_list(query: structs::HttpQuery) -> Option<Vec<#name>> {
                let txn: sqlx::Pool<sqlx::Sqlite> = sqlite_wrapper::get_sqlite_pool().await;
                let mut txn = txn.begin().await.unwrap();

                let data_list: Vec<#name> = sqlite_wrapper::SqlQueryBuilder::new(#db_table_name.to_string(), query)
                    .fetch_all(&mut *txn)
                    .await;

                txn.commit().await.unwrap();

                Some(data_list)
            }
        }
    });
    t
}

fn get_db_table_name(item: ItemStruct) -> String {
    let mut name = "".to_string();
    item.attrs.iter().for_each(|attr| {
        if attr.path().is_ident("crudlf") {
            let t: Expr = attr.parse_args().unwrap();
            match t {
                Expr::Assign(e) => {
                    if e.left.to_token_stream().to_string() == "table_name" {
                        name = e.right.to_token_stream().to_string();
                        name = name.replace("\"", "");
                    } else {
                        panic!("Attribute expression must be in the form of #[crudlf(table_name=\"table_name\")]");
                    }
                }
                _ => {
                    panic!("Attribute expression must be in the form of #[crudlf(table_name=\"table_name\")]");
                }
            }
        }
    });
    if name == "" {
        name = item.ident.to_string();
    }
    name
}

// Get the attributes of the field
fn get_db_field_name(field: &syn::Field) -> CrudlfField {
    let mut name = "".to_string();
    field.attrs.iter().for_each(|attr| {
        if attr.path().is_ident("crudlf") {
            let t: Expr = attr.parse_args().unwrap();
            match t {
                Expr::Assign(e) => {
                    if e.left.to_token_stream().to_string() == "rename" {
                        name = e.right.to_token_stream().to_string();
                        name = name.replace("\"", "");
                    } else {
                        panic!("Attribute expression must be in the form of #[crudlf(rename=\"field_name\")]");
                    }
                }
                _ => {
                    panic!("Attribute expression must be in the form of #[crudlf(rename=field_name)]");
                }
            }
        }
    });
    let struct_field_name = field.ident.as_ref().unwrap().to_string();
    if name == "" {
        name = struct_field_name.clone();
    }
    let is_optional = field
        .ty
        .clone()
        .into_token_stream()
        .to_string()
        .starts_with("Option");

    if is_optional {
        return CrudlfField {
            db_field_name: name.clone(),
            struct_field_name: struct_field_name,
            select_query: format!("{} as \"{}?\"", name, name),
        };
    }
    CrudlfField {
        db_field_name: name.clone(),
        struct_field_name: struct_field_name,
        select_query: format!("{} as \"{}!\"", name, name),
    }
}

fn get_db_field_placeholders(vec: Vec<String>) -> String {
    let mut placeholders = String::new();
    vec.iter().for_each(|_| {
        placeholders.push_str("?, ");
    });
    placeholders.pop();
    placeholders.pop();
    placeholders
}
