/*
count,
sum,
avg (average),
max (maximum),
min (minimum)
*/

SELECT max(weight) FROM users;

SELECT count(*)
FROM users
WHERE weight>90 AND "isMale"=false;



SELECT *
FROM users
WHERE weight=102.0;

SELECT *
FROM users
WHERE weight=(SELECT max(weight) FROM users);

SELECT *
FROM users
WHERE height=(SELECT min(height) FROM users);

SELECT "isMale", sum(weight)
FROM users
WHERE "firstName" ILIKE 'A%'
GROUP BY "isMale";

--кількість чоловіків і жінок
SELECT "isMale",count(*)
FROM users
GROUP BY "isMale";

--кількість людей 1979 року народження
SELECT EXTRACT(year from birthday) AS yearbd,count(*)
FROM users
WHERE EXTRACT(year from birthday)=1979
GROUP BY yearbd;

-- кількість людей по місяцях народження
SELECT "isMale",EXTRACT(month from birthday) AS month_birthday, count(*)
FROM users
GROUP BY "isMale",month_birthday;

--кількість male/female зріст яких більше 1,8

SELECT "isMale",count(*)
FROM users
WHERE height>1.8
GROUP BY "isMale";