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
#[crudlf(table_name = "notes")]
pub struct Note {
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
}
