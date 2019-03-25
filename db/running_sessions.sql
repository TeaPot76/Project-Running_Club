DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS sessions;



CREATE TABLE sessions(
  id SERIAL8 primary key,
  name VARCHAR(255),
  location VARCHAR(255),
  distance INT4,
  level INT4,
  day DATE NOT NULL,
  time_of_day TIME,
  price INT4,
  max_number INT4
);

CREATE TABLE members(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT4,
  level INT4,
  town VARCHAR(255),
  sessions_id INT4 REFERENCES sessions(id) ON DELETE CASCADE
);
