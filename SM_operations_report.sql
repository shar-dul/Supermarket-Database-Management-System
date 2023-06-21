use supermarket;

-- Total number of sales
select count(Sale_id) AS "Sales till date"
from sales;              

-- Total number of purchases
select count(Purchase_id) AS "Purchases till date"
from purchases;          

-- Number of products available in the supermarket
select count(Prod_id) AS "Number of Products" 
from product
where Quantity>0;                                             

-- The number of sales made in 2023
select count(Sale_id) from sales
where SaleDate>"2023-01-01 00:00:00";

-- Total number of items bought by the supermarket from suppliers
select sum(PurchasedQuantity) AS "Total items bought" from contain;

-- Function to get total expenditure of the supermarket
DELIMITER //
CREATE FUNCTION NetExpenditure()
 RETURNS DECIMAL(10,2)
 DETERMINISTIC
BEGIN
	DECLARE netExp DECIMAL(10,2);
    select sum(PurchasedQuantity*BuyPrice)
    into netExp
	from supply 
    join contain on supply.Purchase_id=contain.Purchase_id; 
    return netExp;
END //
DELIMITER ;
SELECT NetExpenditure(); -- Function call

-- Total number of items sold from the supermarket to customers
select sum(SoldQuantity) AS "Total items sold" from has;            

-- Function to get total revenue of the supermarket
DELIMITER //
CREATE FUNCTION NetRevenue()
 RETURNS DECIMAL(10, 2)
 DETERMINISTIC
BEGIN
    DECLARE netRevenue DECIMAL(10, 2);
    select SUM(has.SoldQuantity * product.SellPrice)
    into netRevenue
    from product
    join has on product.Prod_id = has.Prod_id;
    return netRevenue;
END //
DELIMITER ;
SELECT NetRevenue(); -- Function call

-- Procedure that lists the number of times each customer bought a product from the supermarket
DELIMITER //
CREATE PROCEDURE NumberOfBuys()
BEGIN
    select FName, LName, count(Sale_id) as "Number of buys"
    from sales
    join customer on sales.CustID=customer.Cust_id
    group by CustID;
END //
DELIMITER ;
CALL NumberOfBuys(); -- Procedure call

-- Procedure that lists the number of times each employee sold a product from the supermarket
DELIMITER //
CREATE PROCEDURE GetNumberOfSales()
BEGIN
    select FName, LName, count(Sale_id) as "Number of sales" 
    from employee
    join partof on partof.Emp_id=employee.Emp_id
    group by employee.Emp_id;
END //
DELIMITER ;
CALL GetNumberOfSales(); -- Procedure call

-- Procedure that lists the total quantity of each product sold
DELIMITER //
CREATE PROCEDURE GetQuantitySold()
BEGIN
    select product.ProdName, SUM(has.SoldQuantity) as "Quantity Sold"
    from product
    join has on product.Prod_id = has.Prod_id
    group by product.Prod_id;
END //
DELIMITER ;
CALL GetQuantitySold(); -- Procedure call

-- Number of customers
select count(Cust_id) AS "Customers"
from customer;

-- Number of employees
select count(Emp_id) AS "Employees"
from employee;