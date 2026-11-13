CREATE SCHEMA work;

CREATE TABLE IF NOT EXISTS work."users"(
    id serial primary key,
    login varchar(16)
);

SELECT * FROM work.users;