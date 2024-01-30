use structs::HttpQuery;

use crate::models::{FinantialCard, IdentityCard, Login, Note};

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[tokio::main(flavor = "current_thread")]
pub async fn init(db_path: String) -> bool {
    println!("Hello from native!");
    sqlite_wrapper::initiate_sqlite_db_path(db_path.clone()).await;
    let _ = sqlite_wrapper::migrate_sqlite(db_path.as_str()).await;
    true
}

#[tokio::main(flavor = "current_thread")]
pub async fn get_login(id: String) -> anyhow::Result<Login> {
    let login = Login::get(id).await.unwrap();
    Ok(login)
}

#[tokio::main(flavor = "current_thread")]
pub async fn post_login(data: Login) -> anyhow::Result<Login> {
    let login = Login::insert(data).await.unwrap();
    Ok(login)
}

#[tokio::main(flavor = "current_thread")]
pub async fn put_login(id: String, data: Login) -> anyhow::Result<Login> {
    let login = Login::update(id, data).await.unwrap();
    Ok(login)
}

#[tokio::main(flavor = "current_thread")]
pub async fn delete_login(id: String) -> anyhow::Result<Login> {
    let login = Login::delete(id).await.unwrap();
    Ok(login)
}

#[tokio::main(flavor = "current_thread")]
pub async fn list_login(query: HttpQuery) -> anyhow::Result<Vec<Login>> {
    // let query = serde_json::from_str::<structs::HttpQuery>(&query).unwrap();
    let logins = Login::get_list(query).await.unwrap();
    Ok(logins)
}

#[tokio::main(flavor = "current_thread")]
pub async fn get_financial_card(id: String) -> anyhow::Result<FinantialCard> {
    let card = FinantialCard::get(id).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn post_financial_card(data: FinantialCard) -> anyhow::Result<FinantialCard> {
    let card = FinantialCard::insert(data).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn put_financial_card(id: String, data: FinantialCard) -> anyhow::Result<FinantialCard> {
    let card = FinantialCard::update(id, data).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn delete_financial_card(id: String) -> anyhow::Result<FinantialCard> {
    let card = FinantialCard::delete(id).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn list_financial_card(query: HttpQuery) -> anyhow::Result<Vec<FinantialCard>> {
    // let query = serde_json::from_str::<structs::HttpQuery>(&query).unwrap();
    let cards = FinantialCard::get_list(query).await.unwrap();
    Ok(cards)
}

#[tokio::main(flavor = "current_thread")]
pub async fn get_identity_card(id: String) -> anyhow::Result<IdentityCard> {
    let card = IdentityCard::get(id).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn post_identity_card(data: IdentityCard) -> anyhow::Result<IdentityCard> {
    let card = IdentityCard::insert(data).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn put_identity_card(id: String, data: IdentityCard) -> anyhow::Result<IdentityCard> {
    let card = IdentityCard::update(id, data).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn delete_identity_card(id: String) -> anyhow::Result<IdentityCard> {
    let card = IdentityCard::delete(id).await.unwrap();
    Ok(card)
}

#[tokio::main(flavor = "current_thread")]
pub async fn get_note(id: String) -> anyhow::Result<Note> {
    let note = Note::get(id).await.unwrap();
    Ok(note)
}

#[tokio::main(flavor = "current_thread")]
pub async fn post_note(data: Note) -> anyhow::Result<Note> {
    let note = Note::insert(data).await.unwrap();
    Ok(note)
}

#[tokio::main(flavor = "current_thread")]
pub async fn put_note(id: String, data: Note) -> anyhow::Result<Note> {
    let note = Note::update(id, data).await.unwrap();
    Ok(note)
}

#[tokio::main(flavor = "current_thread")]
pub async fn delete_note(id: String) -> anyhow::Result<Note> {
    let note = Note::delete(id).await.unwrap();
    Ok(note)
}

/// Returns a list of notes based on the given query.
///
/// # Parameters
///
/// * `query`: The query to filter notes by.
///
/// # Returns
///
/// A vector of notes that match the given query.
///
/// # Examples
///
/// ```
/// use my_app::structs::HttpQuery;
///
/// let query = r#"
///     {
///         "filter": {
///             "name": {
///                 "eq": "John"
///             }
///         }
///     }
/// "#;
/// let query = serde_json::from_str::<HttpQuery>(query).unwrap();
///
/// let notes = my_app::list_note(query).await.unwrap();
///
/// for note in notes {
///     println!("Note: {}", note.name);
/// }
/// ```
#[tokio::main(flavor = "current_thread")]
pub async fn list_note(query: HttpQuery) -> anyhow::Result<Vec<IdentityCard>> {
    // let query = serde_json::from_str::<structs::HttpQuery>(&query).unwrap();
    let notes = IdentityCard::get_list(query).await.unwrap();
    Ok(notes)
}

#[cfg(test)]
mod tests {

    #[test]
    fn test_get_login() {
        let login = super::get_login("1".to_string()).unwrap();
        println!("{:?}", login);
    }

    #[test]
    fn test_post_login() {
        let login = super::post_login(super::Login {
            id: None,
            name: "test".to_string(),
            username: "test".to_string(),
            password: None,
            url: None,
            note: None,
            created_at: None,
            updated_at: None,
            created_by: None,
            updated_by: None,
            password_hint: None,
        })
        .unwrap();
        println!("{:?}", login);
        let login = super::get_login(login.id.unwrap().to_string()).unwrap();
        println!("{:?}", login);
    }

    #[test]
    fn another() {
        panic!("Make this test fail");
    }
}
