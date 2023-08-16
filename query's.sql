 SELECT * FROM Customers;                          # ---> For all the table
SELECT CustomerName, City FROM Customers; 
SELECT * FROM Customers LIMIT 5;                    #--->The first 5 
SELECT * FROM Customers WHERE Country='USA';

SELECT CustomerID, CustomerName, City
FROM Customers
WHERE Country='USA'and City='Portland' ;

SELECT CustomerID, CustomerName, City
FROM Customers
WHERE Country='USA' or  City='Portland' ;

SELECT CustomerID, CustomerName, City, Country
FROM Customers
WHERE Country='USA' or  City='Germany' ;

SELECT CustomerID, CustomerName, City, Country    # ---> Will give you null
FROM Customers
WHERE Country='USA' and  City='Germany' ;

SELECT CustomerID, CustomerName, City, Country
FROM Customers
WHERE Country='USA' or  City='Germany' 
ORDER BY Country ASC;

SELECT CustomerID, CustomerName, City, Country
FROM Customers
WHERE Country='USA' or  City='Germany' 
ORDER BY Country DESC;

SELECT CustomerID, CustomerName, City, Country
FROM Customers
WHERE Country='USA' or  City='Germany' 
ORDER BY Country, City DESC;

SELECT CustomerID, CustomerName, City, Country
FROM Customers
WHERE Country='USA' or  City='Germany' 
ORDER BY City, Country ASC;

SELECT CustomerID, CustomerName, City, Country
FROM Customers
WHERE Country='USA' or  City='Germany' 
ORDER BY Country DESC ,City ASC;

SELECT DISTINCT Country From Customers;  #--->will delect the duplicated country

SELECT COUNT(*) FROM Customers     #---->Count
WHERE Country='USA'  
ORDER BY Country DESC, City ASC;

SELECT SUM(Quantity) FROM orderdetails;

SELECT SUM(Quantity) FROM orderdetails
WHERE ProductID= 11;

SELECT Country, Count(*)
From Customers
GROUP BY Country;

SELECT Country, Count(*)
From Customers
GROUP BY Country
ORDER BY Country;

SELECT Country, Count(*) as Number_of_customers
From Customers
GROUP BY Country
ORDER BY Country;

SELECT Country, Count(*) as Number_of_customers
From Customers
GROUP BY Country
ORDER BY Number_of_customers DESC;

SELECT Country, Count(*) as Number_of_customers
From Customers
GROUP BY Country
HAVING Number_of_customers > 5
ORDER BY Number_of_customers DESC;

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers                            # --> Data the match between them
ON Orders.CustomerID = Customers.CustomerID;    #---->Join two tables(orderID,CustomerName)

SELECT Customers.CustomerName , Orders.OrderID
FROM Customers                              
LEFT JOIN Orders                         #--->Will bring all column that also don't have order will make it as null 
ON Customers.CustomerID = Orders.CustomerID;     #bring also from the right 

SELECT CustomerName
From Customers
WHERE CustomerID
IN (SELECT CustomerID
	FROM Orders                      # The group is dinamic  ..listed querys
    WHERE ShipperID = 3);        # the names that are related to the number which are lis (selected)
    
SELECT CustomerID
	FROM Orders                      
    WHERE ShipperID = 3;   # Show The numbers only 

SELECT CustomerName
From Customers
WHERE CustomerID
IN (SELECT CustomerID
	FROM Orders                      
    WHERE ShipperID = 300);      #---->empty will show
    
SELECT CustomerName
From Customers
WHERE CustomerID
IN (SELECT distinct CustomerID
	FROM Orders                      # ALso empty
    WHERE ShipperID = 300);

SELECT OrderID,
EXTRACT(YEAR FROM Orderdate)


SELECT CustomerName,
SUBSTRING(CustomerName