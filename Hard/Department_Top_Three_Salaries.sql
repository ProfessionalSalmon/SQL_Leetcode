WITH t1 AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY d.name
            ORDER BY
                salary DESC
        ) AS dense_rank
    FROM
        Employee e
        LEFT JOIN Department d ON e.departmentId = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM
    t1
WHERE
    dense_rank <= 3;