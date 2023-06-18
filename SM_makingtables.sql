drop database if exists supermarket;  -- dropping any already existing 'supermarket' database      
create database supermarket;
use supermarket;                      -- selecting the 'supermarket' database to store all tables

-- 1. Create a table for products, including columns for product name, description, price, and quantity in stock.
create table if not exists product(      
	Prod_id VARCHAR(4) PRIMARY KEY,
	ProdName VARCHAR(30) NOT NULL,
	ProdDescription TEXT,
	SellPrice INT NOT NULL,
	Quantity INT DEFAULT 0
);

-- 2. Create a table for suppliers, including columns for supplier name, address, and contact information.
create table if not exists supplier(
	Supp_id VARCHAR(4) PRIMARY KEY,
	FName VARCHAR(30),
	LName VARCHAR(30),
	SuppContact BIGINT UNIQUE NOT NULL,
	SuppAddress TEXT,
	CHECK(SuppContact BETWEEN 5999999999 AND 10000000000)
);

-- 3. Create a table for customers, including columns for customer name, address, and contact information.
create table if not exists customer(
	Cust_id VARCHAR(4) PRIMARY KEY,
	FName VARCHAR(30),
	LName VARCHAR(30),
	CustContact BIGINT UNIQUE NOT NULL,
	CustAddress TEXT,
	CHECK(CustContact BETWEEN 5999999999 AND 10000000000)
);

-- 4. Create a table for employees, including columns for employee name, address, contact information, and job position.
create table if not exists employee(
	Emp_id VARCHAR(4) PRIMARY KEY,
	FName VARCHAR(30),
	LName VARCHAR(30),
	EmpPosition ENUM("Staff", "Manager", "Owner") DEFAULT "Staff",
	EmpContact BIGINT UNIQUE NOT NULL,
	EmpAddress TEXT,
	CHECK(EmpContact BETWEEN 5999999999 AND 10000000000)
);

-- 5. Create a table for sales, including columns for the date of the sale, the customer who made the purchase, and the products sold.
create table if not exists sales(           
	Sale_id INT NOT NULL AUTO_INCREMENT,
	SaleDate DATETIME NOT NULL,
	CustID VARCHAR(4),
	ProdID VARCHAR(4),
    PRIMARY KEY(Sale_id)
);

-- 6. Create a table for purchases, including columns for the date of the purchase, the supplier who provided the product, and the products purchased.
create table if not exists purchases(        
	Purchase_id INT NOT NULL AUTO_INCREMENT,
	PurchaseDate DATETIME NOT NULL,
	ProdID VARCHAR(4),
	SuppID VARCHAR(4),
    PRIMARY KEY(Purchase_id)
);

-- 7. Create a foreign key constraint between the sales table and the customers table, linking them on the customer ID.
ALTER TABLE sales
ADD FOREIGN KEY(CustID) REFERENCES customer(Cust_id) ON UPDATE CASCADE;

-- 8. Create a foreign key constraint between the sales table and the products table, linking them on the product ID.
ALTER TABLE sales
ADD FOREIGN KEY(ProdID) REFERENCES product(Prod_id) ON UPDATE CASCADE;

-- 9. Create a foreign key constraint between the purchases table and the suppliers table, linking them on the supplier ID.
ALTER TABLE purchases
ADD FOREIGN KEY(SuppID) REFERENCES supplier(Supp_id) ON UPDATE CASCADE;

-- 10. Create a foreign key constraint between the purchases table and the products table, linking them on the product ID.
ALTER TABLE purchases
ADD FOREIGN KEY(ProdID) REFERENCES product(Prod_id) ON UPDATE CASCADE;

-- Creating table 'contain' having attributes purchase ID, product ID and purchased quantity
-- indicating which product and how much of the product is a part of a particular purchase
create table if not exists contain(
	Purchase_id INT PRIMARY KEY,
	Prod_id VARCHAR(4),
	PurchasedQuantity INT DEFAULT 1,
	FOREIGN KEY(Purchase_id) REFERENCES purchases(Purchase_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(Prod_id) REFERENCES product(Prod_id) ON UPDATE CASCADE
);

-- Creating table 'has' having attributes sale ID, product ID and sold quantity
-- indicating which product and how much of the product is sold in a particular sale
create table if not exists has(
	Sale_id INT PRIMARY KEY,
	Prod_id VARCHAR(4),
	SoldQuantity INT,
	FOREIGN KEY(Sale_id) REFERENCES sales(Sale_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(Prod_id) REFERENCES product(Prod_id) ON UPDATE CASCADE
);

-- Creating table 'partof' having attributes sale ID, customer ID and employee ID
-- indicating which customer and which employee is a part of a particular sale
create table if not exists partof(
	Sale_id INT PRIMARY KEY,
	Cust_id VARCHAR(4),
	Emp_id VARCHAR(4),
	FOREIGN KEY(Sale_id) REFERENCES sales(Sale_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(Cust_id) REFERENCES customer(Cust_id) ON UPDATE CASCADE,
	FOREIGN KEY(Emp_id) REFERENCES employee(Emp_id) ON UPDATE CASCADE
);

-- Creating table 'supply' having attributes purchase ID, supplier ID and buying price
-- indicating the price of product at which the purchase was made and the supplier from whom it was made
create table if not exists supply(
	Purchase_id INT PRIMARY KEY,
	Supp_id VARCHAR(4),
	BuyPrice INT,
	FOREIGN KEY(Purchase_id) REFERENCES purchases(Purchase_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(Supp_id) REFERENCES supplier(Supp_id) ON UPDATE CASCADE
);
