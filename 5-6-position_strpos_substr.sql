-- Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.

SELECT
	primary_poc,
	LEFT(primary_poc, STRPOS(primary_poc,' ') - 1) AS first_name,
	RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name
FROM accounts;

-- Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.

SELECT
	name,
	LEFT(name, STRPOS(name,' ') - 1) AS first_name,
	RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
FROM sales_reps;