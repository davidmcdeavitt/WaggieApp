
create database waggie_db;
waggie_db# created

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(400),
  password_digest TEXT
);
above table created





CREATE TABLE animals (
  id SERIAL 4 PRIMARY KEY,
  breed_id INTEGER,

);
**need to figure out if should do this next**
ALTER TABLE animals ADD COLUMN shelter_location INTEGER;

CREATE TABLE breeds
