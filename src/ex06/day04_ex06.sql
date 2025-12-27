DROP MATERIALIZED VIEW IF EXISTS mv_dmitriy_visits_and_eats;
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON pz.id=m.pizzeria_id
JOIN person_visits AS pv ON pv.pizzeria_id=pz.id
JOIN person AS p ON p.id=pv.person_id
WHERE m.price < 800 AND pv.visit_date = '2022-01-08' and p.name = 'Dmitriy'
ORDER BY pizzeria_name;

SELECT * FROM mv_dmitriy_visits_and_eats;
