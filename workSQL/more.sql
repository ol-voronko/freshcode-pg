--JSON

CREATE TABLE IF NOT EXISTS cafes(
    id serial primary key,
    address jsonb
);

INSERT INTO cafes(address)
VALUES ('{"country":"Ukraine","city":"Kyiv","street":"sdfs","house":{"pd":"2","fl":5,"app":56}}');

SELECT * FROM cafes;
