USE project;
-- Q1: Count of purchases per month (excluding refunded purchases)

SELECT 
  DATE_FORMAT(purchase_time, '%Y-%m-01') AS month,
  COUNT(*) AS purchases_count
FROM transactions
WHERE refund_time IS NULL
GROUP BY DATE_FORMAT(purchase_time, '%Y-%m-01');
-- Q2: Number of stores with at least 5 orders in October 2020

SELECT COUNT(*) AS stores_with_5plus_orders
FROM (
    SELECT store_id, COUNT(*) AS total_orders
    FROM transactions
    WHERE purchase_time >= '2020-10-01'
      AND purchase_time < '2020-11-01'
      AND refund_time IS NULL
    GROUP BY store_id
    HAVING COUNT(*) >= 5
) AS x;

-- Q3: Shortest refund time in minutes per store

SELECT
  store_id,
  MIN(TIMESTAMPDIFF(MINUTE, purchase_time, refund_time)) AS min_refund_minutes
FROM transactions
WHERE refund_time IS NOT NULL
  AND refund_time >= purchase_time
GROUP BY store_id;

-- Q4: First order (by time) for each store

WITH ranked AS (
    SELECT
      store_id,
      item_id,
      gross_transaction_value,
      ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY purchase_time ASC) AS rn
    FROM transactions
)
SELECT store_id, item_id, gross_transaction_value
FROM ranked
WHERE rn = 1;

-- Q5: Most popular item on first purchase

WITH first_tx AS (
    SELECT
      buyer_id,
      item_id,
      ROW_NUMBER() OVER (PARTITION BY buyer_id ORDER BY purchase_time ASC) AS rn
    FROM transactions
),
first_items AS (
    SELECT ti.item_name
    FROM transaction_items ti
    JOIN first_tx ft ON ti.item_id = ft.item_id
    WHERE ft.rn = 1
)
SELECT item_name, COUNT(*) AS popularity
FROM first_items
GROUP BY item_name
ORDER BY popularity DESC
LIMIT 1;

-- Q6: Refund processable flag (within 72 hours)

SELECT
  ti.*,
  CASE
    WHEN tr.refund_time IS NOT NULL
      AND TIMESTAMPDIFF(HOUR, tr.purchase_time, tr.refund_time) <= 72
    THEN 1 ELSE 0
  END AS refund_processable_flag
FROM transaction_items ti
JOIN transactions tr ON ti.item_id = tr.item_id;

-- Q7: Second purchase per buyer (ignore refunds)

WITH ranked_tx AS (
    SELECT
      item_id,
      buyer_id,
      ROW_NUMBER() OVER (PARTITION BY buyer_id ORDER BY purchase_time ASC) AS rn
    FROM transactions
    WHERE refund_time IS NULL
)
SELECT ti.*
FROM transaction_items ti
JOIN ranked_tx rt ON ti.item_id = rt.item_id
WHERE rt.rn = 2;

-- Q8: Find second transaction time per buyer

WITH ranked2 AS (
    SELECT
      buyer_id,
      purchase_time,
      ROW_NUMBER() OVER (PARTITION BY buyer_id ORDER BY purchase_time ASC) AS rn
    FROM transactions
)
SELECT buyer_id, purchase_time AS second_purchase_time
FROM ranked2
WHERE rn = 2;

