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

-- Total expenditure of the supermarket
select sum(PurchasedQuantity*BuyPrice) AS "NET COST" 
from supply join contain 
on supply.Purchase_id=contain.Purchase_id;   

-- Total number of items sold from the supermarket to customers
select sum(SoldQuantity) AS "Total items sold" from has;            

-- Total revenue of the supermarket
select sum(SoldQuantity*SellPrice)  AS "NET REVENUE"
from product join has 
on product.Prod_id=has.Prod_id;     

-- Lists the number of times each customer bought a product from the supermarket
select FName, LName, count(Sale_id) AS "Number of buys"                         
from sales join customer 
on sales.CustID=customer.Cust_id
group by CustID;

-- Lists the number of times each employee sold a product from the supermarket
select FName, LName, count(Sale_id) AS "Number of sales"                          
from employee join partof 
on partof.Emp_id=employee.Emp_id
group by employee.Emp_id;

-- Lists the total quantity of each product sold 
select ProdName, sum(SoldQuantity) AS "Quantity Sold"                           
from product join has 
on product.Prod_id=has.Prod_id
group by product.Prod_id;

-- Number of customers
select count(Cust_id) AS "Customers"
from customer;

-- Number of employees
select count(Emp_id) AS "Employees"
from employee;