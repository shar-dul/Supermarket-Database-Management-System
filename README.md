# Supermarket-Database-Management-System
The system is designed to manage the day-to-day operations and processes of a supermarket. The database schema of the system consists of different tables such as product, sales, purhcases, employee, customer, and supplier. Each of these tables holds the necessary information that is required for the smooth operation of the supermarket.

### ER Diagram:
 ![er diag](https://github.com/shar-dul/Supermarket-Management-System/assets/99119676/65125d1c-17c9-4ec7-8d3e-c0b36c79f1cf)

### Tables created:
+ product(**Prod_id**, ProdName, ProdDescription, SellPrice, Quantity)
+ customer(**Cust_id**, FName, LName, CustContact, CustAddress)
+ purchases(**Purchase_id**, PurchaseDate, ProdID, SuppID)
+ supplier(**Supp_id**, FName, LName, SuppContact, SuppAddress)
+ employee(**Emp_id**, FName, LName, Position, EmplContact, EmplAddress)
+ sales(**Sale_id**, SaleDate, CustID, ProdID)

  Relationship tables:
  + contain(**Purchase_id**, ProdID, PurchasedQuantity)
  + supply(**Purchase_id**, Supp_id, BuyPrice)
  + has(**Sale_id**, Prod_id, SoldQuantity)
  + partof(**Sale_id**, Cust_id, Emp_id)

### Relational schema showing the functional dependencies:
![rel sch](https://github.com/shar-dul/Supermarket-Management-System/assets/99119676/0a85e86d-ed2f-41df-9326-d349c69cd477)

### Normalization:
+ The 1NF is guaranteed because every attribute in every table is atomic, i.e., has only one value.
+ The 2NF is guaranteed by the fact that primary keys are chosen such that they're always unique, which shows that there are no partial dependencies.
+ The 3NF is maintained as there are no transitive dependencies. The primary key alone can determine the row table selected.

### Features:
+ Can add employee, customer, supplier details like Name, Contact, Address, etc.
+ Can add product information like Name, description, price and quantity in stock.
+ Can add details of all sales transactions made by the supermarket including specific information such as the respective customer associated with each sale and the corresponding employee responsible for making the sale.
+ Can add details of all purchases of products made by the supermarket including the supplier details that supplied the respective product.
+ Can generate reports of various aspects of the supermarkets' functioning using the **Operations_report.sql** file.
