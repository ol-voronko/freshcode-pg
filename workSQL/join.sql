--INNER JOIN

--отримати замовлення користувача з id=34
SELECT users.id,email,orders.id
FROM users
JOIN orders ON users.id=orders."userId"
WHERE users.id=34;

--отримати всі замовлення з sony

SELECT  o.id,count(*)  
FROM orders AS o
JOIN phones_to_orders AS p_o ON  o.id=p_o."orderId"
JOIN phones AS p ON p_o."phoneId"=p.id
WHERE p.brand ILIKE 'Sony'
GROUP BY o.id,p.brand;

--отримати всі замовлення  з вказанням бренду та кількості покупок одного бренду,відсортоване за номерои замовлення
SELECT  o.id,p.brand,count(p.*)  
FROM orders AS o
JOIN phones_to_orders AS p_o ON  o.id=p_o."orderId"
JOIN phones AS p ON p_o."phoneId"=p.id
GROUP BY o.id,p.brand
ORDER BY o.id;

INSERT INTO phones (brand, model, price, quantity)
VALUES ('MyBrand','Best 25',2569,20),
('MyBrand','Best 46',6569,10);

--бренди ,які купували 

SELECT p.brand
FROM phones AS p
JOIN phones_to_orders AS pto ON p.id=pto."phoneId"
GROUP BY p.brand;

--і які не купували
SELECT p.brand
FROM phones AS p
LEFT JOIN phones_to_orders AS pto ON p.id=pto."phoneId"
WHERE pto."phoneId" IS NULL
GROUP BY p.brand;

--кількість проданих телефонів
SELECT p.id,p.model, sum(pto.quantity)
FROM phones AS p
FULL OUTER JOIN phones_to_orders AS pto ON p.id=pto."phoneId"
GROUP BY p.id
ORDER BY p.id;

--пошта користувачів які купляли нокіа
SELECT u.email
FROM users AS u
JOIN orders AS o ON u.id=o."userId"
JOIN phones_to_orders AS pto ON o."id"=pto."orderId"
JOIN phones AS p ON pto."phoneId"=p.id
WHERE p.brand ILIKE 'NOKIA'
GROUP BY u.email; 

--Знайдіть ID користувачів, які мають більше ніж 3 замовлення.
SELECT u.id,u.email,count(o.*)
FROM users AS u
JOIN orders AS o ON u.id=o."userId"
GROUP BY u.id
HAVING count(o.*)>3
ORDER BY count(o.*) DESC;

--Знайдіть ID замовлень, у яких назва телефону містить "14", а також email відповідних користувачів.

SELECT u.email,o.id,P.model
FROM users AS u
JOIN orders AS o ON u.id=o."userId"
JOIN phones_to_orders AS pto ON o.id=pto."orderId"
JOIN phones AS p ON pto."phoneId"=p.id
WHERE p.model LIKE '%14%';

--Виведіть 5 назв телефонів, які купували найчастіше.

SELECT p.brand,p.model,sum(pto.quantity)
FROM phones AS p
JOIN phones_to_orders AS pto ON p.id=pto."phoneId"
JOIN orders AS o ON pto."orderId"=o.id
GROUP BY p.brand,p.model
ORDER BY sum(pto.quantity) DESC
LIMIT 5;

--п'ять телефонів, які зустрічалися в найбільшій кількості різних замовлень


sELECT brand FROM phones
WHERE brand ILIKE 'MYbRAND';

sELECT count(*)
from orders;