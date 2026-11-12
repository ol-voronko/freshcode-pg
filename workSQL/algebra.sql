CREATE TABLE IF NOT EXISTS a(s VARCHAR(3),n INT);
CREATE TABLE IF NOT EXISTS b(d VARCHAR(3));

INSERT INTO a 
VALUES('qwe',1),('qqq',2),('asd',3);

INSERT INTO b VALUES ('qwe'),('sdd'),('cvb');

--декартів добуток
SELECT * FROM a,b;

--об`єднання таблиць,повинно співпадати кількіть стовпців і їх типи.Назви стовпців співпадають з назвою першої таблиці і в результаті тільки унікальні значення(не повторюються ті які співпали)
SELECT s FROM a
UNION
SELECT  w FROM b;

--перетин.В результаті будуть тілки дані які співпали

SELECT * FROM b
INTERSECT
SELECT s FROM a;

--віднімання.Залишаються дані які унікальні  лівої таблиці, які не співпадають з правою

SELECT * FROM b
EXCEPT
SELECT s FROM a;

SELECT s FROM a
EXCEPT
SELECT d FROM b;

INSERT INTO users (
    "firstName",
    "lastName",
    email,
    "isMale",
    birthday,
    height,
    weight
  )
VALUES ('Brad','Pitt','brad11@gmail.com',true,'2000-01-16',1.8,90),
('Frodo','Pitt','frodo11@gmail.com',true,'2000-01-16',1.65,75.5);

SELECT id FROM users
INTERSECT
SELECT "userId" FROM orders;

--знайти id користувачів,які НЕ робили замовлення
SELECT id FROM users
EXCEPT
SELECT "userId" FROM orders;

SELECT email FROM users
WHERE id IN (SELECT id FROM users
EXCEPT
SELECT "userId" FROM orders);

SELECT *
FROM a
 JOIN b ON a.s=b.d;