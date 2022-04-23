use Northwind;

/* 1. **************************************************************************************************
tigger: Cree un trigger que se active cuando se inserte o actualice un registro de la tabla
Territories recuerde tomar el registro actual desde la tabla inserted y concatene al
nombre del Territorio (TerritoryDescription) el prefijo “_try” al final del mismo. */
go
create Trigger trigger1 on Territories
AFTER insert,update
as
Begin
update Territories
set TerritoryDescription = i.TerritoryDescription+'try'
from Territories
inner join inserted i on Territories.TerritoryID = i.TerritoryID
end
go
--prueba de uso
insert INTO Territories values ('0008','tutry',4)
--alter table Territories alter column TerritoryDescription varchar(100)


/*2. **********************************************************************************************************************
Tiggger: Cree un trigger para la tabla CustomerCustomerDemo que se active cuando se
inserte o actualice un registro y calcule el campo CustomerDesc multiplicando el
valor proveído en el insert * 0.25 y sumando 150*/

--cambio antes del trigger
alter table CustomerDemographics 
alter column CustomerDesc money

--trigger
go
create Trigger trigger2 on CustomerDemographics
after insert,update
as 
begin
update CustomerDemographics
set CustomerDesc = i.CustomerDesc*0.25+150
from CustomerDemographics
inner join inserted  i on CustomerDemographics.CustomerTypeID = i.CustomerTypeID
end
go

--prueba de uso
select *from CustomerDemographics
insert into CustomerDemographics values ('4',100)
--drop trigger trigger2

/*3. trigger: ******************************************************************************************************************
Cree un trigger a la tabla CustomerDemogragraphics que se active cuando un
registro es eliminado y que muestre un mensaje que diga “registro eliminado” y
muestre un select de la tabla deleted.*/
go
CREATE TRIGGER trigger3 on CustomerDemographics
after delete
as 
begin
select *from deleted
print('Registro Eliminado')
end
go
--prueba de el disparador
delete CustomerDemographics where CustomerTypeID ='3';


--funciones**********************************************************************************************
/* funcion1
Construya una función que reciba como parámetro el año de contratación de
un empleado (HireDate) de la tabla employees y devuelva una tabla con todos
los registros asociados*/
go
create function funcion1 (@year int) 
returns table 
as return(
select *from Employees
where @year = year(HireDate)
)
go 
--prueba de funcion
select *from dbo.funcion1(1994)


/*2. funcion2
 Cree una función que reciba como parámetro el id de la tabla producto
 (products) y retorne el precio (UnitPrice) aplicando el 10% de descuento.
*/

go
Create function funcion2 (@id int)
returns  money as
begin
declare @precio money
select @precio = (UnitPrice-UnitPrice*0.1) from Products
where @id = ProductID
return @precio
end
go
--probando la funcion
select dbo.funcion2(1)


/*funcion3: 
Cree una función que reciba como parámetro el OrderId y muestre información
de la orden (Order) y de su detalle (Order Details) mostrando ProductName,
UnitPrice y Quantitiy, OrderDate, CustomerID.
*/
go
CREATE function funcion3 (@orderid int)
returns table
as return(
select p.ProductName,p.UnitPrice,od.Quantity, o.OrderDate, o.CustomerID
from Orders o
inner join [Order Details] od on od.OrderID = o.OrderID
inner join Products p on p.ProductID = od.ProductID 
where o.OrderID = @orderid
)
go
--prueba de funcion3
select *from dbo.funcion3(10248)

/*  funcion4:
   Construya una función que reciba la fecha de nacimiento (BirthDate) de un
   empleado (Employees) y retorne el nombre del mes en el que nació el
   empleado considere el uso de la sentencia case.
*/
go
Create function funcion4 (@fecha date)
returns varchar(20) 
as
begin
declare @mes varchar(20)
select @mes = 
case 
	when month(BirthDate)= 1 then 'enero'
	when month(BirthDate)= 2 then 'Febrero'
	when month(BirthDate)= 3 then 'Marzo'
	when month(BirthDate)= 4 then 'Abril'
	when month(BirthDate)= 5 then 'Mayo'
	when month(BirthDate)= 6 then 'Junio'
	when month(BirthDate)= 7 then 'Julio'
	when month(BirthDate)= 8 then 'agosto'
	when month(BirthDate)= 9 then 'Septiembre'
	when month(BirthDate)= 10 then 'Octubre'
	when month(BirthDate)= 11 then 'Noviembre'
	when month(BirthDate)= 12 then 'Diciembre'
end 
from Employees
where @fecha = BirthDate  --verificacion que un empleado cumpla en dicha fecha
return @mes
end
go

select dbo.funcion4('1952-02-19') as Mes

/*5.  funcion5:
	Construya una función que reciba el código de un cliente y retorne todos los
	pedidos (Orders) ordenados por fecha
*/
go
CREATE FUNCTION funcion5(@id nchar(5))
returns table
return (select *from Orders where CustomerID = @id )
go

select *from funcion5('1')



