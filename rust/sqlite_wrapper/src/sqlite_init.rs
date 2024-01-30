use sqlx::{
    migrate::MigrateError,
    // sqlite::{SqliteConnectOptions, SqliteJournalMode},
    Error,
    Pool,
    Sqlite,
    SqlitePool,
};
use std::fs::OpenOptions;
use tokio::sync::OnceCell;

static ONCE_SQLITE_POOL: OnceCell<Result<Pool<Sqlite>, Error>> = OnceCell::const_new();
static ONCE_SQLITE_MIGRATE: OnceCell<Result<(), MigrateError>> = OnceCell::const_new();
static ONCE_SQLITE_DB_PATH: OnceCell<String> = OnceCell::const_new();

pub async fn initiate_sqlite_db_path(db_file: String) {
    ONCE_SQLITE_DB_PATH.get_or_init(|| async { db_file }).await;
}

pub async fn initiate_sqlite_pool(db_file: &str) -> Result<&Pool<Sqlite>, &Error> {
    ONCE_SQLITE_POOL
        .get_or_init(|| async {
            // SqlitePool::connect_with(
            //     SqliteConnectOptions::new()
            //         .filename(db_file)
            //         .journal_mode(SqliteJournalMode::Wal),
            // );
            let pool = SqlitePool::connect(db_file).await?;
            Ok(pool)
        })
        .await
        .as_ref()
}

pub async fn create_file_if_not_exists(file: &str) {
    let path = std::path::Path::new(file);
    if !path.exists() {
        let file = OpenOptions::new()
            .write(true)
            .create(true)
            // .truncate(true)
            .open(path)
            .unwrap();
        drop(file);
    }
}

pub async fn migrate_sqlite(db_file: &str) -> Result<&Pool<Sqlite>, &Error> {
    create_file_if_not_exists(db_file).await;
    let pool = (initiate_sqlite_pool(db_file).await)?;

    ONCE_SQLITE_MIGRATE
        .get_or_init(|| async { sqlx::migrate!("../migrations").run(pool).await })
        .await;

    Ok(pool)
}

pub async fn get_sqlite_pool() -> Pool<Sqlite> {
    let path = ONCE_SQLITE_DB_PATH.get().unwrap();

    let pool = initiate_sqlite_pool(path).await.unwrap();

    pool.to_owned()
}
