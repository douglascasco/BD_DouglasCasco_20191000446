--Douglas Josue Casco Herrera -20191000446

use Northwind

--consulta Ejercicio #1
SELECT FirstName,LastName,HireDate from Employees
where Title='Sales Representative' and Country = 'USA'

--consulta Ejercicio #2 
SELECT *from Products
where ProductName LIKE '%Chocolate%'

--consulta Ejercicio #3
SELECT *from Orders
where ShipCountry in ('Germany','France','Brazil','Venezuela')

--consulta Ejericio #4
SELECT COUNT(CustomerID) as TotalCustomers FROM Customers

--consulta Ejercicio #5
SELECT Country as paises from Customers
group by Country

--Consulta Ejercicio #6
SELECT ProductID,ProductName,CompanyName
FROM Products as p,Suppliers as s
order by ProductID

--consulta Ejercicio #7
SELECT ProductName, UnitsInStock, ReorderLevel
FROM Products
where UnitsInStock < ReorderLevel

--Consulta Ejericcio #8 cuando pongo cero es 'Discontinued' quiero decir false no esta descontinuado asi lo aprecie
SELECT ProductName, UnitsInStock, UnitsOnOrder,
ReorderLevel, Discontinued
FROM Products as p
where ((UnitsInStock+UnitsOnOrder) < = ReorderLevel) AND Discontinued = 0

--Consulta Ejercicio #9
SELECT *from Products  
where UnitPrice between  15 and 25
order by UnitPrice --fue un extra para que se aprecie mejor

--Consulta Ejercicio #10
SELECT *from Suppliers
where Fax is null

--consulta Ejericio #11
SELECT AVG(Freight) as PROMEDIO FROM Orders

--consulta Ejercicio #12 Nota: USE el correlativo del ID ERNSH que es 20
Update Customers set ContactName ='Douglas Josue Casco Herrera'
where CustomerID = 'ERNSH'

/*consulta ejericio #13 como es una tabla que tiene referencias a otras,
se tiene que eliminar los registros que hacen referencia al mismo, tambien que tomamos como id = 91 su correlativo */
DELETE [dbo].[Order Details] where [dbo].[Order Details].OrderID = orderID
DELETE Orders where CustomerID = 'WOLZA'
DELETE Customers where CustomerID = 'WOLZA'
select *from Customers -- para que se vea que se borro ese registro

--consulta Ejercicio #14 
select MAX(UnitPrice) as PRECIO_MAXIMO,MIN(UnitPrice) as PRECIO_MINIMO  from Products