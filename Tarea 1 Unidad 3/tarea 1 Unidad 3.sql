use Northwind;
/*puse el 'Go' para que no salga subrayado el Query*/
--Seccion 1
-->Vistas
/*1. Cree una vista que muestre todos los empleados (employees) que reportan
(ReportsTo) a un jefe.*/
go
CREATE VIEW ej1 as  
select *
from Employees as empleado
where ReportsTo > 0
go
--llamando a la view
select *from ej1

/*2. Crear una vista que muestre el ProductID, CompanyName, ProductName,
CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock,
UnitsOnOrder, ReorderLevel, Discontinued de la tabla Supplier, Products and
Categories.*/
go
CREATE VIEW ej2 as
select 
p.ProductID,s.CompanyName,p.ProductName,c.CategoryName,
c.Description,p.QuantityPerUnit,p.UnitPrice,p.UnitsInStock,
p.UnitsOnOrder,p.ReorderLevel,p.Discontinued
from Products p 
inner join Suppliers s ON p.SupplierID = s.SupplierID
inner join Categories c ON c.CategoryID = p.CategoryID
--prueba de la view
go
--ejecucion de la vista.
SELECT * from ej2


/*3. Cree una vista que muestre el CustomerID, CompanyName, ContactName,
ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate
de la table Customer y Orders*/
go
CREATE VIEW ej3 as 
SELECT c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address, 
c.City,c.Country,c.Phone,o.OrderDate,o.RequiredDate,o.ShippedDate
from 
Customers c
inner join Orders o ON c.CustomerID = o.CustomerID
go

select *from ej3

/* 4. Modifique la vista del item 3 y remueva el  Campo ContactTitle */
--al momento de practicar esa fue la unica forma que se me ocurrió removerla de la consulta
go
alter view ej3 as
SELECT c.CustomerID,c.CompanyName,c.ContactName,c.Address, 
c.City,c.Country,c.Phone,o.OrderDate,o.RequiredDate,o.ShippedDate
from 
Customers c
inner join Orders o ON c.CustomerID = o.CustomerID
go

/*5. Elimine la vista del item 3*/
Drop view ej3;

/**************************************************************************************************/
--seccion 2:

--Procedimientos Almacenados
/*1. Cree un procedimiento almacenado que muestre todas las ordenes (Orders)
realizadas por un empleado en un determinado año.*/
go
create procedure procedimiento1 
@year int
as
select * from Employees e
inner join Orders o ON e.EmployeeID = o.EmployeeID
where  YEAR(o.OrderDate)= (@year) 
go
--ejecucion del procedimiento
execute procedimiento1 @year = 1997
go


/* 2. Realice un procedimiento almacenado que muestre los clientes que pertencen a
determinada ciudad. */
 go
 CREATE PROCEDURE procedimiento2
 @ciudad varchar(100) as
select *
 from Customers as c
  where c.City = @ciudad
  go
  execute procedimiento2 @ciudad ='México D.F.'


  /*3.Construya un procedimiento almacenado que filter los empleados que cumpleaños
cada mes utilizando el BirthDate.*/ 
Go
Create Procedure procedimiento3 
@mes int
as
select *from Employees 
where MONTH(BirthDate) = @mes
go
--ejecución
execute procedimiento3 @mes = 3


/*4.  Obtener todas las ordenes generadas en una fecha determinada */
Go
create procedure procedimiento4 
@fecha date
as
select * from Orders
where OrderDate = @fecha
go
--ejecucion del procedimiento
execute procedimiento4 @fecha = '1996-08-27'


/*5. Realizar un procedimiento almacenado que actualize el telefono de un
determinado cliente.*/ --el select solo lo pusé para que mostrar que realmente actualizó el telefono
GO
CREATE PROCEDURE procedimiento5 
@empleadoID nchar(5), @new_phone nvarchar(24)
as
update Customers set Phone = @new_phone
where CustomerID = @empleadoID
select *from Customers
go
--ejecucion procedimiento5
execute procedimiento5 @empleadoID = 'ALFKI', @new_phone = '98466688'	







