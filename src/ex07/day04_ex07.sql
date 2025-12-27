INSERT INTO 
    person_visits (id, person_id, pizzeria_id, visit_date) 
VALUES
    ((SELECT MAX(id) FROM person_visits) + 1,
    (SELECT id FROM person WHERE name LIKE 'Dmitriy'),
    (SELECT DISTINCT PZ.id
FROM pizzeria PZ
JOIN menu MN ON MN.pizzeria_id = PZ.id
WHERE MN.price < 800
  AND NOT EXISTS (
    SELECT 1
    FROM mv_dmitriy_visits_and_eats MV
    WHERE MV.pizzeria_name = PZ.name
  ) LIMIT 1),
    '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
