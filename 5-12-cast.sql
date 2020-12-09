-- Write a query to look at the top 10 rows to understand the columns and the raw data in the dataset called sf_crime_data.

SELECT * 
FROM sf_crime_data
LIMIT 10;

-- Write a query to change the date into the correct SQL date format. You will need to use at least SUBSTR and CONCAT to perform this operation.
-- (CORRUPTED DATE:	01/31/2014 08:00:00 AM +0000)

SELECT 	date corrupted_date,
		SUBSTRING(date, 7 , 4) 
		|| '-'
		|| SUBSTRING(date, 1 , 2) 
		|| '-'
		|| SUBSTRING(date, 4 , 2) AS corrected_date 
FROM sf_crime_data
LIMIT 10;

-- Once you have created a column in the correct format, use either CAST or :: to convert this to date.

SELECT	date corrupted_date, 
		(SUBSTRING(date, 7 , 4) 
		|| '-'
		|| SUBSTRING(date, 1 , 2) 
		|| '-'
		|| SUBSTRING(date, 4 , 2))::date AS corrected_date 
FROM sf_crime_data
LIMIT 10;