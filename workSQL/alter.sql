
CREATE TYPE task_status AS ENUM('done','in progress','pending','reject');
DROP TABLE tasks;
CREATE TABLE IF NOT EXISTS tasks(
    id serial PRIMARY KEY,
    body varchar(256) NOT NULL,
    user_id int REFERENCES users(id),
    deadline timestamp,
    status task_status
);
 
INSERT INTO tasks(body,user_id,deadline)
VALUES ('BODY1',1,'2026-12-01'),
('BODY',24,'2026-11-30'),
('BODY3',2,'2026-11-21');

INSERT INTO tasks(body,user_id,deadline,status)
VALUES ('new body','20','2026-11-15','pending');

SELECT * FROM tasks;

--додати нову колонку
ALTER TABLE tasks 
ADD COLUMN createdAt timestamp NOT NULL DEFAULT current_timestamp;

--видалити колонку
ALTER TABLE tasks
DROP COLUMN createdAt;

--add new constraint
ALTER TABLE tasks
ADD CHECK(createdAt<=current_timestamp);

--delete constraint
ALTER TABLE tasks
DROP CONSTRAINT tasks_createdat_check;

--set NOT NULL

UPDATE tasks
SET status='done'
WHERE status IS NULL;

ALTER TABLE tasks
ALTER COLUMN status SET NOT NULL;

--delete NOT NULL

ALTER TABLE tasks
ALTER COLUMN status DROP NOT NULL;


--set DEFAULT
ALTER TABLE tasks
ALTER COLUMN deadline SET DEFAULT current_timestamp;

ALTER TABLE tasks
ALTER COLUMN status SET DEFAULT 'pending';

INSERT INTO tasks(body,user_id)
VALUES('buy bread',5);


--delete DEFAULT
ALTER TABLE tasks
ALTER COLUMN status DROP DEFAULT;

--update type
ALTER TABLE tasks
ALTER COLUMN body TYPE varchar(2000);

--rename
ALTER TABLE tasks
RENAME COLUMN body TO description;

ALTER TABLE tasks
RENAME TO user_tasks;

SELECT * FROM user_tasks;

--додати колонку вага до таблиці users 
--numeric(4,1) default (height-1)*100
ALTER TABLE users
ADD COLUMN weight numeric(4,1) ;

UPDATE users
SET weight=(height-1)*100;

ALTER TABLE users
ALTER COLUMN weight SET NOT NULL;
SELECT * FROM users;