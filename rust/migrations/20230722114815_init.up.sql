CREATE TABLE  IF NOT EXISTS finantial_cards (
    id TEXT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    created_by TEXT NOT NULL,
    updated_at DATETIME,
    updated_by TEXT,
    card_holder_name TEXT NOT NULL,
    card_number TEXT NOT NULL,
    card_provider_name TEXT,
    card_type TEXT,
    cvv TEXT,
    expiry_date TEXT,
    issue_date TEXT,
    name TEXT NOT NULL,
    note TEXT,
    pin TEXT
);

CREATE TABLE  IF NOT EXISTS identity_cards (
    id TEXT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    created_by TEXT NOT NULL,
    updated_at DATETIME,
    updated_by TEXT,
    name TEXT NOT NULL,
    note TEXT,
    country TEXT,
    expiry_date TEXT,
    identity_card_number TEXT NOT NULL,
    identity_card_type TEXT,
    issue_date TEXT,
    name_on_card TEXT NOT NULL,
    state TEXT
);

CREATE TABLE  IF NOT EXISTS logins (
    id TEXT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    created_by TEXT NOT NULL,
    updated_at DATETIME,
    updated_by TEXT,
    name TEXT NOT NULL,
    note TEXT,
    username TEXT NOT NULL,
    url TEXT,
    password TEXT,
    password_hint TEXT
);

CREATE TABLE  IF NOT EXISTS notes (
    id TEXT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    created_by TEXT NOT NULL,
    updated_at DATETIME,
    updated_by TEXT,
    name TEXT NOT NULL,
    note TEXT NOT NULL
);