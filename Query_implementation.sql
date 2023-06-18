use supermarket;

-- 11. Insert a new product into the products table: eg. A new bottle which costs Rs. 150 which 
--     initially has default quantity zero
INSERT INTO product(Prod_id, ProdName, ProdDescription, SellPrice)
VALUES("P111", "Bottle", "Premium quality bottle of one litre capacity", "150");
 
-- 12. Insert a new supplier into the suppliers table: eg. Swara Tripathi who supplies bottles
INSERT INTO supplier
VALUES("S111", "Swara", "Tripathi", 8999234116, "Tripathi Plastics, Vasant Kunj, Delhi");

-- 13. Insert a new customer into the customers table: eg. Vidit Shukla 
INSERT INTO customer
VALUES("C111", "Vidit", "Shukla", 6669981200, "701, Tailwind, Bhusari Colony");

-- 14. Insert a new employee into the employees table: eg. Sharad Shelke
INSERT INTO employee(Emp_id, FName, LName, EmpContact, EmpAddress)
VALUES("E111", "Sharad", "Shelke", 8811123345, "101, Sai Kamal, Wakad, Pune");

-- 16. Insert a new purchase into the purchases table, including the supplier ID, the product ID, and the date of the purchase:
--     eg. Purchase of twenty bottles being made from Sharad Shelke on 2nd April 2023
INSERT INTO purchases(PurchaseDate, ProdID, SuppID)
VALUES("2023-04-02 14:27:56", "P111", "S111");
INSERT INTO supply
VALUES(11, "S111", 120);
INSERT INTO contain
VALUES(11, "P111", 20);
UPDATE product SET Quantity=20 WHERE Prod_id="P111";    -- updating the  quantity of bottles as twenty in the product table

-- 15. Insert a new sale into the sales table, including the customer ID, the product ID, and the date of the sale:
--     eg. Sale containing three bottles being bought by Vidit Shukla on 5th April 2023 by Devyani Khare
INSERT INTO sales(SaleDate, CustID, ProdID)
VALUES("2023-04-05 15:33:12", "C111", "P111");
INSERT INTO partof
VALUES(11, "C111", "E108");
INSERT INTO has
VALUES(11, "P111", 3);

-- 17. Update the quantity in stock for a specific product in the products table: eg. Since Vidit Shukla bought 3 bottles, now we have 3
--     less bottles left in quantity
UPDATE product 
SET Quantity=Quantity-3 
WHERE Prod_id="P111";

-- 18. Update the contact information for a specific supplier in the suppliers table:
--     eg. Changing phone number of Ashish Joshi from 9908745362 to 9563259001
UPDATE supplier 
SET SuppContact=9563459001 
WHERE Supp_id="S107";

-- 19. Update the job position for a specific employee in the employees table:
--     eg. Changing job position of employee Advait Kelkar from Staff to Manager
UPDATE employee 
SET EmpPosition="Manager" 
WHERE Emp_id="E110";

-- 20. Delete a specific sale from the sales table based on the sale ID:
--     eg. Delete the sale having Sale_id as 6
DELETE FROM sales 
WHERE Sale_id=6;
