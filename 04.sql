SELECT DISTINCT who as person_id FROM (
    SELECT a.person_id as who, b.superior as tmp
    FROM comp AS a
    LEFT OUTER JOIN comp AS b
    ON a.person_id = b.superior
) as x
WHERE tmp IS NULL;
