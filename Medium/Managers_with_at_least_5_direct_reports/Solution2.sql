SELECT
    name
FROM
    (
        SELECT
            e1.name,
            e1.id
        FROM
            Employee e1,
            Employee e2
        WHERE
            e2.managerId = e1.id
        GROUP BY
            e1.name,
            e1.id
        HAVING
            COUNT(*) >= 5
    ) AS t1;