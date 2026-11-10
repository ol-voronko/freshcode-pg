SELECT * FROM users;

--дістати id, ім`я та ДН жінок з  парними id 
SELECT id,"firstName","isMale","birthday"
FROM users
WHERE "isMale"=false AND id%2=0;

SELECT id, "firstName"
FROM users
WHERE id BETWEEN 15 AND 20;

SELECT id, email,birthday
FROM users
WHERE EXTRACT(YEAR from birthday)<1987;

--пошта і дн всіх хто напрдився взимку
SELECT id, email, birthday
FROM users
WHERE EXTRACT(MONTH from birthday) IN(1,2,12);

--всі менше 30 років

SELECT id,birthday
FROM users
WHERE age(birthday)<make_interval(30);
--АБО
--WHERE EXTRACT(year from age(birthday))<30;

--пошта,дн,зріст,стать усіх чоловіків старше 40 років зі зростом иенше  1,9м
SELECT id, email, birthday, height, "isMale",EXTRACT(YEAR from age(birthday)) AS age
FROM users
WHERE "isMale" IS TRUE 
    AND height<1.9 
    AND age(birthday)>make_interval(40);

--всіх Amy,Jenny,Marie,Lisa молодше 40років 
SELECT *
FROM(
    SELECT id,"firstName",EXTRACT(year from age(birthday)) AS age
    FROM users
    WHERE "firstName" IN ('Amy','Lisa','Jenny','Marie')
)
 WHERE age<40;

--ТІЛЬКИ  перші 7 РЯДКІВ
SELECT *
FROM users
WHERE height>1.75
LIMIT 7;

-- якшо відступити 2 сторінки(limit*ofset)
SELECT *
FROM users
WHERE height>1.75
LIMIT 7
OFFSET 2;

--конкатенація

SELECT  id,"firstName"||' ' ||"lastName" as full_name
FROM users
LIMIT 5;

SELECT  id,concat("firstName",' ', "lastName") as full_name
FROM users
LIMIT 5;

SELECT  id,concat("firstName",' ', null) as full_name
FROM users
LIMIT 5;

SELECT  id,concat( "lastName",' ',left("firstName",1),'.') as full_name
FROM users
LIMIT 5;

SELECT *
FROM(
    SELECT  id,concat( "lastName",' ',left("firstName",1),'.') as full_name
    FROM users
)
WHERE length(full_name)<8;

SELECT id,"firstName"
FROM users
WHERE "firstName" LIKE 'A%';

SELECT id,"firstName"
FROM users
WHERE "firstName" ILIKE 'a%';