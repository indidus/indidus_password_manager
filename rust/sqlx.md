# Migrate

## To check all environment variables

```bash
printenv
```

## Set environment variables

```bash
export DATABASE_URL="sqlite://password.db"
```

## Create database

```bash
sqlx database create
```

## Drop database

```bash
sqlx database drop
```

## Drops the database specified in your DATABASE_URL, re-creates it, and runs any pending migrations

```bash
sqlx database setup
```

## Create migration

```bash
cargo sqlx migrate add <name>
```

## Run migration

```bash
cargo sqlx migrate run
```

## Revert migration

```bash
cargo sqlx migrate revert
```

## List migrations

```bash
cargo sqlx migrate info
```

## Enable building in "offline mode" with query!()

```bash
cargo sqlx prepare
```

```bash
cargo sqlx prepare --check
```

