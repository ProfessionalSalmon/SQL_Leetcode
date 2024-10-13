WITH t1 AS (
    SELECT
        buyer_id,
        COUNT(*) AS orders_in_2019
    FROM
        Orders
    WHERE
        DATENAME(yyyy, order_date) = '2019'
    GROUP BY
        buyer_id
)
SELECT
    user_id AS buyer_id,
    join_date,
    COALESCE(orders_in_2019, 0) AS orders_in_2019
FROM
    t1
    RIGHT JOIN Users ON t1.buyer_id = Users.user_id;