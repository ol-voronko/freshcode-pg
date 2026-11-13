CREATE VIEW email_season AS (
SELECT email,birthday,EXTRACT(month from birthday),(
    CASE EXTRACT(month from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spring'
        WHEN 5 THEN 'spring'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'autumn'
        WHEN 10 THEN 'autumn'
        WHEN 11 THEN 'autumn'
        WHEN 12 THEN 'winter'
    END
) AS season
FROM users);

SELECT * FROM email_season;

SELECT * FROM email_season
WHERE season='winter';

SELECT season,count(*)
FROM email_season
GROUP BY season;

DELETE FROM users
WHERE id=57
RETURNING *;

DROP VIEW user_total_cost;
--email і загальна сума витрачених грошей юзера
CREATE VIEW  email_total_cost AS(
    SELECT email, sum(p.price*pto.quantity) AS total
    FROM users AS u
JOIN orders AS o ON u.id= o."userId"
JOIN phones_to_orders AS pto ON o.id=pto."orderId"
JOIN phones AS p ON pto."phoneId"=p.id
GROUP BY email
);

--люди якого сезону народження  витрачають найбільше грошей
SELECT es.season,sum(etc.total) AS sum
FROM email_season AS es
JOIN email_total_cost AS etc ON es.email=etc.email
GROUP BY es.season
ORDER BY sum DESC;

