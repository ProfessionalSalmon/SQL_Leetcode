SELECT
    user_id AS buyer_id,
    join_date,
    SUM(
        CASE
            WHEN DATEPART(year, order_date) = 2019 THEN 1
            ELSE 0
        END
    ) AS orders_in_2019
FROM
    Users u
    LEFT JOIN Orders o ON user_id = buyer_id
GROUP BY
    user_id,
    join_date;