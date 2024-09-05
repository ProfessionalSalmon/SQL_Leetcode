WITH t1 AS (
    SELECT
        p.product_id,
        COALESCE(price, 0) AS price,
        COALESCE(units, 0) AS units
    FROM
        Prices p
        LEFT JOIN UnitsSold u ON p.product_id = u.product_id
    WHERE
        (
            purchase_date BETWEEN start_date
            AND end_date
        )
        OR purchase_date IS NULL
)
SELECT
    product_id,
    ROUND(
        SUM(price * units * 1.0) / SUM(
            CASE
                WHEN units = 0 THEN 1
                ELSE units
            END
        ),
        2
    ) AS average_price
FROM
    t1
GROUP BY
    product_id;