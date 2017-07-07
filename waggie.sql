
create database waggie_db;
waggie_db# created

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(400),
  password_digest TEXT
);
above table created

\c waggie_db
to connect to database

only up to here done

CREATE TABLE friends (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  name TEXT,
  sex TEXT,
  mix TEXT,
  zip_code TEXT,
  species TEXT
);




-- CREATE TABLE user_types (
--   id SERIAL4 PRIMARY KEY,
--   user_id INTEGER,
--   type VARCHAR(16),
--   CHECK(type in ('adopt', 'manage shelter'))
-- );


ALTER TABLE users ADD COLUMN user_types_id INTEGER(5)
CONSTRAINT Checklocation CHECK (Location > 99999);



ALTER TABLE users ADD COLUMN Location INTEGER(5)
CONSTRAINT Checklocation CHECK (Location > 99999);
