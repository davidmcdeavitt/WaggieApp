
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
<li><%= result.name %></li>
<li><%= result.sex %></li>
<li><%= result.mix %></li>
<li><%= @zip_code %></li>
<li><%= @type %></li>





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

CREATE TABLE animals (
  id SERIAL 4 PRIMARY KEY,
  breed_id INTEGER,

);
**need to figure out if should do this next**
ALTER TABLE animals ADD COLUMN shelter_location INTEGER;

CREATE TABLE breeds
