DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sessions;

CREATE TABLE customers(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4,
  level INT4,
  town VARCHAR(255)
);

CREATE TABLE sessions(
  id SERIAL8 primary key,
  name VARCHAR(255),
  location VARCHAR(255),
  distance INT4,
  level INT4,
  day VARCHAR(255),
  time_of_day TIME,
  price INT4,
  customers_id INT4 REFERENCES customers(id) ON DELETE CASCADE
);
