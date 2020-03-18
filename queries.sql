-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT productname, categoryname
FROM product
JOIN category
    ON category.id = categoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT *
FROM 'order'
WHERE orderdate < '2012-08-09'
ORDER BY orderdate 

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT productname, quantity
FROM orderDetail
JOIN product
    ON productId = product.id
WHERE orderid = 10251


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT ID AS OrderID, c.CompanyName, e.LastName
FROM 'order'
JOIN customer AS c
    ON customerId = c.id
JOIN employee AS e
    ON employeeId = e.id