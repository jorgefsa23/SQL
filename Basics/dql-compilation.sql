DQL (Data Query Language) commands in SQL with examples:

#1. SELECT: Selects data from a database table.
SELECT * FROM customers;


#2. WHERE: Add filters on records based on a specified condition.
SELECT * 
FROM customers 
WHERE country='USA';


#3. ORDER BY: Sorts the result set in ascending (ASC) or descending (DESC) order.
SELECT * 
FROM products 
ORDER BY price DESC;


#4. GROUP BY: Groups rows based on a specified column.
SELECT country,     #select the column country
COUNT(*)            #counts all rows by country
FROM customers      #table name
GROUP BY country;   #groups the result


#5. JOIN: Combines data from two or more tables based on a related column.
SELECT customers.name, orders.order_date        #two columns selected
FROM customers                                  # table 1
INNER JOIN orders                               # table 2, INNER JOIN: by common colum
ON customers.customer_id = orders.customer_id;  # specify which common column

#6. HAVING: Filters records based on a condition that uses an aggregate function.
SELECT country, AVG(price) as avg_price     # selects a column country, the average price of products by country
FROM products                               # from this table
GROUP BY country                            # by country is how the average is calculated
HAVING AVG(price) > 1000;                   # only averages of price > 1000 will be considered

#7. LIMIT: Limits the number of records returned from the database.
SELECT * 
FROM products 
LIMIT 10;               # select the first 10 records in products

#8. IN: Filters records based on multiple possible values.
SELECT * 
FROM customers          # select from this table
WHERE country           # filter the results base on a condition
IN ('USA', 'Canada');   # the condition is to match, either "USA" or "Canada"

#9. NOT: Negates a condition.
SELECT * 
FROM customers                  #from this table
WHERE NOT country='USA';        # shows those that are not 'USA'

#10. EXISTS: Tests for the existence of any record in a subquery.
SELECT *                        #select all
FROM customers                  #from this table... based on the next condition... a subquery
WHERE EXISTS (SELECT * FROM orders WHERE orders.customer_id = customers.customer_id);
# subquery: selcts all columns from table 'orders' where id matches with id in table 'customers'

#11. SUBQUERY: A query within a query. To retrieve data that will be used in the main query.
SELECT *                    #select all
FROM orders                 #from this table
WHERE customer_id IN (      #filtering by customer_id...
    SELECT customer_id      #matching...
    FROM customers          #on this table
    WHERE country = 'USA'   #condition
);

#12. UNION: Combines the result of two or more SELECT statements into a single result set.
SELECT name, email 
FROM customers
UNION
SELECT name, email 
FROM employees;

#13. WITH: Creates a temporary table that can be used in the main query.
WITH top_customers AS (
    SELECT customer_id, SUM(price) as total_spent
    FROM orders
    GROUP BY customer_id
    ORDER BY total_spent DESC
    LIMIT 10
)
SELECT customers.name, top_customers.total_spent
FROM top_customers
INNER JOIN customers
ON top_customers.customer_id = customers.customer_id;

#14. EXISTS vs JOIN: A comparison between using EXISTS and JOIN to achieve the same result.
-- Using EXISTS --
SELECT *
FROM customers
WHERE EXISTS (
    SELECT *
    FROM orders
    WHERE orders.customer_id = customers.customer_id
);
-- Using JOIN --
SELECT *
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

#15. CASE: A conditional statement that returns a specific value based on a specified condition.
SELECT name, price,
CASE 
    WHEN price < 10 THEN 'Low'
    WHEN price >= 10 AND price < 50 THEN 'Medium'
    ELSE 'High'
END as price_category
FROM products;
