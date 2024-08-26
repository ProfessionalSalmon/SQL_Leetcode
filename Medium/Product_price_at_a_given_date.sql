WITH latest_change_date AS (
    SELECT
        product_id,
        MAX(change_date) AS change_date
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
    GROUP BY
        product_id
),
distinct_id AS (
    SELECT
        DISTINCT product_id
    FROM
        products
)
SELECT
    d.product_id,
    COALESCE(new_price, 10) AS price
FROM
    Products p
    JOIN latest_change_date l ON p.change_date = l.change_date
    AND p.product_id = l.product_id
    RIGHT JOIN distinct_id d ON p.product_id = d.product_id;