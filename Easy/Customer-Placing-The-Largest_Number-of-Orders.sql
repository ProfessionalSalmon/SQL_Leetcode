WITH t1 AS (
    SELECT
        COUNT(order_number) AS count
    FROM
        Orders
    GROUP BY
        customer_number
),
t2 AS (
    SELECT
        MAX(count) AS max_count
    FROM
        t1
)
SELECT
    customer_number
FROM
    Orders
GROUP BY
    customer_number
HAVING
    COUNT(order_number) IN (
        SELECT
            *
        FROM
            t2
    );