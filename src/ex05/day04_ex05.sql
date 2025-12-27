/*
имени клиента (person_name),
названия пиццы (pizza_name),
реальной цены (real_price),
столбца discount_price (рассчитывается по формуле price - price * 0.1, то есть с 10% скидкой).
Отсортируй результаты по имени клиента (person_name) и названию пиццы (pizza_name) и приведи 
столбец discount_price к целочисленному типу (integer).
*/


CREATE OR REPLACE VIEW v_price_with_discount AS 
SELECT person.name , menu.pizza_name AS pizza_name, menu.price AS price , CAST(price - (price * 0.1) AS int) AS discount_price
FROM person_order
JOIN person ON person.id=person_order.person_id
JOIN menu ON menu.id=person_order.menu_id
ORDER BY 1,2;