SELECT * FROM `The Challenge`.consumer_complaints;


-- Find out how many complaints were sent and received on the same day

SELECT `Date Received`, COUNT(*) AS received_complaints
FROM consumer_complaints
GROUP BY `Date Received`;

-- Extract the complaints received in the states of New York
SELECT *
FROM consumer_complaints 
WHERE `State Name` = 'NY';

-- Extract the complaints received in the states of New York and Ohio

SELECT *
FROM consumer_complaints 
WHERE `State Name` IN ('NY', 'OH');

-- Extract all rows with the word "Credit" in the Product field
SELECT *
FROM consumer_complaints
WHERE `Product Name` LIKE '%credit%';

-- Extract all rows with the word "Late" in the Issue field

SELECT *
FROM consumer_complaints
WHERE Issue LIKE '%late%';

-- Write a query to identify the top five states with the highest number of consumer complaints.

SELECT `State Name`, COUNT(*) AS number_of_complaints
FROM consumer_complaints
GROUP BY `State Name`
ORDER BY number_of_complaints DESC
LIMIT 5;

-- Find the most common consumer issue and sub-issue in the dataset.

SELECT Issue, COUNT(Issue) AS number_of_issues
FROM consumer_complaints
GROUP BY Issue
ORDER BY number_of_issues DESC
LIMIT 1;

SELECT
    CASE
        WHEN `Sub Issue` IS NULL OR `Sub Issue` = '' THEN 'No Sub Issue Specified'
        ELSE `Sub Issue`
    END AS Sub_Issue,
    COUNT(*) AS number_of_sub_issues
FROM consumer_complaints
GROUP BY Sub_Issue
ORDER BY number_of_sub_issues DESC
LIMIT 1;

-- Calculate the percentage of complaints that received a timely response from companies.

SELECT
    (SUM(CASE WHEN `Timely Response` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_timely_response
FROM consumer_complaints;


-- Group the complaints by month and calculate the number of complaints received each month.

SELECT MONTH(`Date Received`) AS month_received, COUNT(`Date Received`) AS number_of_complaints
FROM consumer_complaints
GROUP BY month_received
ORDER BY month_received;

-- Determine the total number of consumer disputed and undisputed complaints.

SELECT
	CASE
        WHEN `Consumer Disputed` IS NULL OR `Consumer Disputed` = '' THEN 'Unknown'
        ELSE `Consumer Disputed`
	END AS `Consumer Disputed`,
  COUNT(*) AS total_complaints
FROM consumer_complaints
GROUP BY `Consumer Disputed`;

-- Find 5 companies with the most consumer complaints.

SELECT Company, COUNT(Company) AS company_with_most_complaints
FROM `consumer_complaints`
GROUP BY Company
ORDER BY company_with_most_complaints DESC
LIMIT 5;


-- Calculate the number of complaints submitted via various channels, such as web, phone, or email.

SELECT `Submitted via`, COUNT(`Submitted via`) AS number_of_submissions
FROM `consumer_complaints`
GROUP BY `Submitted via`
ORDER BY number_of_submissions DESC;

-- Identify the top 10 zip codes with the most consumer complaints.

SELECT `Zip Code`, COUNT(`Zip Code`) AS number_complaints
FROM `consumer_complaints`
GROUP BY `Zip Code`
ORDER BY number_complaints DESC
LIMIT 10;

-- Products with the most complaints
SELECT `Product Name`, COUNT(`Product Name`) AS number_complaints
FROM `consumer_complaints`
GROUP BY `Product Name`
ORDER BY number_complaints DESC;











