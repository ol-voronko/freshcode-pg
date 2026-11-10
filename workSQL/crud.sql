SELECT id,height
FROM users;

UPDATE users
SET height=(height+0.01)
RETURNING id,height;

--змінити зріст чоловіків молодших за 40 років
UPDATE users
SET height=(height+0.01)
WHERE "isMale" IS TRUE 
AND age(birthday)<make_interval(40)
RETURNING id,height ,EXTRACT(year from age(birthday));

--оновити зріст всім жінкам імя яких починається на літеру s
UPDATE users
SET height=(height+0.02)
WHERE "isMale" IS FALSE 
 AND "firstName" LIKE 'S%'
RETURNING id,"firstName",height; 

INSERT INTO users("firstName","lastName",email,"isMale",birthday,height)
VALUES
( 'Ottp','bob','vov@gmail.com',true,'2000-12-10',1.95),
( 'HJtp','boba','vov12@gmail.com',true,'2000-12-10',1.55),
( 'Olfa','Pemza','pemza@gmail.com',false,'2005-02-10',1.95)
RETURNING*;

DELETE FROM users
WHERE id=54
RETURNING*;

