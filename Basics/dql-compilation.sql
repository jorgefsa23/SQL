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
COUNT(*)            #counts all rows
FROM customers      #table name
GROUP BY country;   #groups the result


#5. JOIN: Combines data from two or more tables based on a related column.
SELECT customers.name, orders.order_date
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

#6. HAVING: Filters records based on a condition that uses an aggregate function.

```
SELECT country, AVG(price) as avg_price
FROM products
GROUP BY country
HAVING AVG(price) > 1000;
```

#7. LIMIT: Limits the number of records returned from the database.

```
SELECT * FROM products LIMIT 10;
```

#8. IN: Filters records based on multiple possible values.

```
SELECT * FROM customers WHERE country IN ('USA', 'Canada');
```

#9. NOT: Negates a condition.

```
SELECT * FROM customers WHERE NOT country='USA';
```

#10. EXISTS: Tests for the existence of any record in a subquery.

```
SELECT * FROM customers WHERE EXISTS (SELECT * FROM orders WHERE orders.customer_id = customers.customer_id);
```
