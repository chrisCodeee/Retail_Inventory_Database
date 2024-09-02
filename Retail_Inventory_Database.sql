------------------------ ASSIGNMENT_1 -------------------------------------------

create database RetailInventoryDb
use RetailInventoryDb

create table Product(ID int identity(1,1), ProductID nvarchar(3) primary key, ProductName nvarchar(20), CategoryID int, Price int, Quantity int)
create table Category(CategoryID int, CategoryName nvarchar(20))
create table Supplier(ID int identity(1,1), SupplierID int, SupplierName nvarchar(15), ContactNumber nvarchar(15))
create table Warehouse(ID int identity(1,1), WarehouseID nvarchar(3), WarehouseName nvarchar(20), Location nvarchar(20))

insert into Product
Values('P01', 'Laptop', 1, 1200, 50),
('P02', 'Smartphone', 1, 800, 100),
('P03', 'TV', 2, 1500, 30),
('P04', 'Refrigerator', 2, 900, 25),
('P05', 'Microwave', 3, 200, 60),
('P06', 'Washing Machine', 2, 1100, 20),
('P07', 'Headphones', 4, 100, 200),
('P08', 'Camera', 1, 700, 15),
('P09', 'Air conditioner', 2, 1300, 10),
('P10', 'Blender', 3, 150, 80)

insert into Category
values(1, 'Electronics'),
(2, 'Appliances'),
(3, 'Kitchenware'),
(4, 'Accessories')

insert into Supplier
values(101,'SupplierA', '123-456-7890'),
(102,'SupplierB', '234-567-8901'),
(103,'SupplierC', '345-678-9012'),
(104,'SupplierD', '456-789-0123'),
(105,'SupplierE', '567-890-1234'),
(106,'SupplierF', '678-901-2345'),
(107,'SupplierG', '789-012-3456'),
(108,'SupplierH', '890-123-4567'),
(109,'SupplierI', '901-234-5678'),
(110,'SupplierJ', '012-345-6789')


insert into Warehouse
values('W01', 'MainWarehouse', 'New York'),
('W02', 'EastWarehouse', 'Boston'),
('W03', 'WestWarehouse', 'San Diego'),
('W04', 'NorthWarehouse', 'Chicago'),
('W05', 'SouthWarehouse', 'Miami'),
('W06', 'CentralWarehouse', 'Dallas'),
('W07', 'PacificWarehouse', 'San Francisco'),
('W08', 'MountainWarehouse', 'Denver'),
('W09', 'SouthernWarehouse', 'Atlanta'),
('W10', 'GulfWarehouse', 'Houston')

---- (1) Fetch products with the same price.-----------------

select ProductName, Price from Product 
where Price in(
select distinct price from Product)

----------------- (2) Find the second highest priced product and its category.-------------------------
select ProductName, price, CategoryName from Product p
join Category c
on p.CategoryID = c.CategoryID
order by Price desc
OFFSET 1 Row
Fetch next 1 row only

--------------------- (3) Get the maximum price per category and the product name.---------------------------------
select ProductName, CategoryID, Price Max_Price from Product
where Price in(
select max(price) Max_Price from Product p
join Category c
on p.CategoryID = c.CategoryID
group by p.CategoryID
)

-------------------- (4) Supplier-wise count of products sorted by count in descending order. --------------------------


-------------------- (5) Fetch only the first word from the ProductName and append the price. --------------------------
select concat(Left(ProductName, 1), '_', Price) Initial_Salary from Product

---------------------- (6) Fetch products with odd prices. ----------------------------
select * from Product 
where price % 2 != 0

------------------------ (7) Create a view to fetch products with a price greater than $500. --------------------------------------
create view VW_Product_greaterThan_500 as
select * from Product
where price > 500

------------------------- (8) Create a procedure to update product prices by 15% where the category is 'Electronics' 
-------------------------------and the supplier is not 'SupplierA'. --------------------------------------------------------------------
create procedure Update_Price 
	
as
begin
	update P
	set Price = Price * 1.25
	from Product P
	join Category c on p.CategoryID = c.CategoryID
	join Supplier s on p.ID = s.ID
	where c.CategoryName = 'Electronics' and s.SupplierName != 'SupplierA'

	--with Product_Details as(
	--select p.ProductName, p.Price, c.CategoryName, s.SupplierName from Product p
	--join Category c on p.CategoryID = c.CategoryID
	--join Supplier s on p.ID = s.ID
	--)

	--update Product_Details set Price = (Price * 1.25) where CategoryName = 'Electronics' and SupplierName != 'SupplierA'
end
go

exec Update_Price

------------------------------- (9) Create a stored procedure to fetch product details along with their category, supplier, 
------------------------------------ and warehouse location, including error handling. -----------------------------------------------------------------
CREATE PROCEDURE Fetch_Product_Details 
	
AS
BEGIN
	BEGIN TRY
		SELECT p.ProductName, p.Price, c.CategoryName, s.SupplierName, w.WarehouseName FROM Product p
		join Category c ON p.CategoryID = c.CategoryID
		join Supplier s ON p.ID = s.ID
		join Warehouse w ON p.ID = w.ID
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		SET @ErrorMessage = ERROR_MESSAGE();
		RAISERROR (@ErrorMessage, 16, 1);
	END CATCH
END
GO

EXEC Fetch_Product_Details