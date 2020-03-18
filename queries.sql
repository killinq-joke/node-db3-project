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

--Find the number of shipments by each shipper

SELECT ShipperName, count(orders.shipperId) as ShipmentNumber
FROM [Orders]
JOIN shippers
	ON Orders.shipperID = shippers.ShipperID
GROUP BY ShipperName

--Find the top 5 best performing employees measured in revenue

SELECT (firstname || ' ' || lastname) as TOP5_Employees,  SUM(p.price * quantity) as revenue FROM [Employees] as e
join orders as o
	on o.employeeid = e.employeeid
join orderdetails as od
	on od.orderid = o.orderid
join products as p
	on p.productid = od.productid
group by TOP5_Employees
order by revenue desc
limit 5


--Find the product category that brings in the most revenue

SELECT categoryname, SUM(price * quantity) as revenue
FROM [Products] as p
join categories as c
	on c.categoryid = p.categoryid
join orderdetails as od
	on od.productid = p.productid
group by c.categoryid
order by c.categoryid

--Find the customer country with the most orders

SELECT country, SUM(quantity) as orders FROM [Customers] as c
join orders as o
	on o.customerid = c.customerid
join orderdetails as od
	on od.orderid = o.orderid
group by country
order by orders desc

--Find the shipper that moves the most cheese measured in units

SELECT s.shippername, sum(quantity) as cheese_moved FROM Shippers as s
join orders as o
	on o.shipperid = s.shipperid
join orderdetails as od
	on od.orderid = o.orderid
join products as p
	on p.productid = od.productid
join categories as c
	on c.categoryid = p.categoryid
where c.categoryid = 4
group by s.shipperid
order by s.shipperid
