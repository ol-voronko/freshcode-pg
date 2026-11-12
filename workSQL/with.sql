--дістати замовлення сума,яких вище за середню суму

--замовлення і його сума
SELECT pto."orderId",sum(pto.quantity*p.price)
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId"=p.id
GROUP BY pto."orderId";

--середня сума замовлень

SELECT avg(cost)
FROM(
    SELECT pto."orderId",sum(pto.quantity*p.price) AS cost
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
) as orders_cost;

--замовлення сума,яких вище за середню суму

SELECT *
FROM(
    SELECT pto."orderId",sum(pto.quantity*p.price) AS cost
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
) as orders_cost
WHERE orders_cost.cost>(SELECT avg(cost)
FROM(
    SELECT pto."orderId",sum(pto.quantity*p.price) AS cost
FROM phones_to_orders AS pto
JOIN phones AS p ON pto."phoneId"=p.id
GROUP BY pto."orderId"
) as orders_cost)
ORDER BY orders_cost.cost;

--оптимізація з WITH

WITH orders_cost AS(
    SELECT pto."orderId",sum(pto.quantity*p.price) AS cost
    FROM phones_to_orders AS pto
        JOIN phones AS p ON pto."phoneId"=p.id
    GROUP BY pto."orderId"
)

SELECT oc.*
FROM orders_cost AS oc
WHERE oc.cost>(SELECT avg(oc.cost) FROM orders_cost AS oc)  --скалярний підзапит
ORDER BY oc.cost;
