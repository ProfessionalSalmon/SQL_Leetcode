WITH t1 AS (
    SELECT
        departmentId,
        MAX(salary) AS max_salary
    FROM
        Employee
    GROUP BY
        departmentId
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    max_salary AS Salary
FROM
    t1
    JOIN Employee e ON t1.departmentId = e.departmentId
    AND e.salary = max_salary
    JOIN Department d ON t1.departmentId = d.id;