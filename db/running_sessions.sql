DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS bookings;



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
  town VARCHAR(255)
);

CREATE TABLE bookings(
  id SERIAL8 primary key,
  instructor_name VARCHAR(255),
  members_id INT4 REFERENCES members(id) ON DELETE CASCADE,
  sessions_id INT4 REFERENCES sessions(id) ON DELETE CASCADE
);
