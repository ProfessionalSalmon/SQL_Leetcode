WITH t1 AS (
    SELECT
        customer_id,
        MIN(order_date) AS order_date
    FROM
        Delivery
    GROUP BY
        customer_id
),
t2 AS (
    SELECT
        t1.customer_id,
        t1.order_date,
        customer_pref_delivery_date
    FROM
        t1
        JOIN Delivery d ON t1.order_date = d.order_date
        AND t1.customer_id = d.customer_Id
)
SELECT
    ROUND(
        SUM(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 100.0
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS immediate_percentage
FROM
    t2;