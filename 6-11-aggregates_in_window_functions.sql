-- Run the query that Derek wrote in the previous video in the first SQL Explorer below. Keep the query results in mind; you'll be comparing them to the results of another query next.

SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at)	AS month,
       DENSE_RANK()		 	OVER (PARTITION BY account_id 	ORDER BY DATE_TRUNC('month',occurred_at)) AS dense_rank,
       SUM(standard_qty) 	OVER (PARTITION BY account_id 	ORDER BY DATE_TRUNC('month',occurred_at)) AS sum_std_qty,
       COUNT(standard_qty) 	OVER (PARTITION BY account_id 	ORDER BY DATE_TRUNC('month',occurred_at)) AS count_std_qty,
       AVG(standard_qty) 	OVER (PARTITION BY account_id 	ORDER BY DATE_TRUNC('month',occurred_at)) AS avg_std_qty,
       MIN(standard_qty) 	OVER (PARTITION BY account_id 	ORDER BY DATE_TRUNC('month',occurred_at)) AS min_std_qty,
       MAX(standard_qty) 	OVER (PARTITION BY account_id 	ORDER BY DATE_TRUNC('month',occurred_at)) AS max_std_qty
FROM orders;

-- Now remove ORDER BY DATE_TRUNC('month',occurred_at) in each line of the query that contains it in the SQL Explorer below. Evaluate your new query, compare it to the results in the SQL Explorer above, and answer the subsequent quiz questions.

SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at)	AS month,
       DENSE_RANK()		 	OVER (PARTITION BY account_id) AS dense_rank,
       SUM(standard_qty) 	OVER (PARTITION BY account_id) AS sum_std_qty,
       COUNT(standard_qty) 	OVER (PARTITION BY account_id) AS count_std_qty,
       AVG(standard_qty) 	OVER (PARTITION BY account_id) AS avg_std_qty,
       MIN(standard_qty) 	OVER (PARTITION BY account_id) AS min_std_qty,
       MAX(standard_qty) 	OVER (PARTITION BY account_id) AS max_std_qty
FROM orders;
