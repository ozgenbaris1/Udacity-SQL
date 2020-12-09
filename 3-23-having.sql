-- How many of the sales reps have more than 5 accounts that they manage?

SELECT s.name, COUNT(s.*) num
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
GROUP BY s.name
HAVING COUNT(s.*) > 5

-- How many accounts have more than 20 orders?

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;

-- Which account has the most orders?

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;

-- Which accounts spent more than 30,000 usd total across all orders?

SELECT a.id, a.name, SUM(total_amt_usd) total_amount
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) > 30000
ORDER BY total_amount;


-- Which accounts spent less than 1,000 usd total across all orders?

SELECT a.id, a.name, SUM(total_amt_usd) total_amount
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) < 1000
ORDER BY total_amount;

-- Which account has spent the most with us?

SELECT a.id, a.name, SUM(total_amt_usd) total_amount
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_amount DESC
LIMIT 1;

-- Which account has spent the least with us?

SELECT a.id, a.name, SUM(total_amt_usd) total_amount
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_amount
LIMIT 1;

-- Which accounts used facebook as a channel to contact customers more than 6 times?

SELECT a.id, a.name, w.channel, COUNT(*) num_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY num_used;

-- Which account used facebook most as a channel?

SELECT a.id, a.name, w.channel, COUNT(*) num_used
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY num_used DESC
LIMIT 1;

-- Which channel was most frequently used by most accounts?

SELECT w.channel, COUNT(*) num_used
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
GROUP BY w.channel
ORDER BY num_used;
