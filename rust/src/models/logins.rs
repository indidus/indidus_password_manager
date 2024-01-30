use chrono::NaiveDateTime;
use crudlf_derive::{SqliteDelete, SqliteInsert, SqliteListFilter, SqliteSelect, SqliteUpdate};
use serde::{Deserialize, Serialize};
use sqlx::FromRow;

#[derive(
    Debug,
    Clone,
    PartialEq,
    Serialize,
    Deserialize,
    FromRow,
    SqliteInsert,
    SqliteSelect,
    SqliteUpdate,
    SqliteDelete,
    SqliteListFilter,
)]
#[crudlf(table_name = "logins")]
pub struct Login {
    #[serde(rename = "id")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub id: Option<String>,

    #[serde(rename = "created_at")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub created_at: Option<NaiveDateTime>,

    #[serde(rename = "created_by")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub created_by: Option<String>,

    #[serde(rename = "updated_at")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub updated_at: Option<NaiveDateTime>,

    #[serde(rename = "updated_by")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub updated_by: Option<String>,

    #[serde(rename = "name")]
    pub name: String,

    #[serde(rename = "note")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub note: Option<String>,

    #[serde(rename = "username")]
    pub username: String,

    #[serde(rename = "url")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub url: Option<String>,

    #[serde(rename = "password")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub password: Option<String>,

    #[serde(rename = "password_hint")]
    #[serde(skip_serializing_if = "Option::is_none")]
    pub password_hint: Option<String>,
}
