--сортувати рядочки
--сортувати групи

SELECT id,email,height
FROM users
ORDER BY height DESC
LIMIT 1;

SELECT id,email,height,birthday
FROM users
ORDER BY height ASC,birthday DESC;

SELECT id,email,height
FROM users
ORDER BY height DESC, email ASC;

--відсортувати користувачів за віком та іменем
SELECT id,EXTRACT(year from age(birthday)) as age,"firstName"
FROM users 
ORDER BY age,"firstName";

--рахуємо кількість людей певного віку і сортуємо за кількістю
SELECT count(*) AS amount,EXTRACT(year from age(birthday)) AS age
FROM users
GROUP BY age
HAVING count(*)>2
ORDER BY amount DESC;

--або
SELECT *
FROM(
    SELECT count(*) AS amount,EXTRACT(year from age(birthday)) AS age
    FROM users
    GROUP BY age)
WHERE amount>2
ORDER BY amount DESC;   

--порахувати кількість моделей телефонів по кожному бренду і  вивести тільки ті,де кількість менше 5

SELECT count(*) ,brand
FROM phones
GROUP BY brand
HAVING count(*)<5;

--порахувати кількість юзерів по місяцях народження і залишити ті місяці,де кількість юзерів >5

SELECT EXTRACT(month from age(birthday)) AS monthbd,count(*)
FROM users
GROUP BY monthbd
HAVING count(*)>5;


