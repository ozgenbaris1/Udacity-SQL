-- Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?

SELECT DATE_PART('year', occurred_at) yyyy, SUM(total_amt_usd)
FROM orders
GROUP BY DATE_PART('year', occurred_at)
ORDER BY yyyy;


-- Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?

SELECT DATE_PART('month', occurred_at) ord_month, SUM(total_amt_usd) total
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY total DESC;

-- Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?

SELECT DATE_PART('year', occurred_at) yyyy, COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?

SELECT DATE_PART('month', occurred_at) ord_month, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY total_sales DESC;

-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?

SELECT DATE_PART('year', o.occurred_at) ord_year, DATE_PART('month', o.occurred_at) ord_month, a.name, SUM(gloss_amt_usd) total_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY 1, 2, 3
HAVING a.name = 'Walmart'
ORDER BY total_spent DESC;
