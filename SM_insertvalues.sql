use supermarket;
INSERT INTO product(Prod_id, ProdName, ProdDescription, SellPrice, Quantity)
VALUES
("P101", "Bread", "A loaf of whole wheat brown bread divided into twenty slices", 30, 10),
("P102", "Milk", "A carton containing half a litre of fresh cow's milk", 33, 16),
("P103", "Eggs", "A carton having six eggs", 36, 15),
("P104", "Potatoes", "Half a kilo of organic potatoes", 25, 20),
("P105", "Chicken", "One kilo of frozen chicken", 170, 9),
("P106", "Rice", "A five kilo pack of the finest and aroma rich rice", 450, 20),
("P107", "Noodles", "Pack of four of yummy and flavourful noodles", 75, 18),
("P108", "Wine", "Half a litre of the best quality red wine", 700, 10),
("P109", "Coffee", "Fifty grams of coffee made using specially selected and roasted beans", 170, 14),
("P110", "Fruit Juice", "One litre of mixed-fruit juice rich in vitamin C and E, calcium, and iron", 110, 10);

INSERT INTO customer(Cust_id, FName, LName, CustContact, CustAddress)
VALUES
("C101", "Raj", "Verma", 6784532467, "104, Aseem, Bavdhan"),
("C102", "Kaushal", "Dwivedi", 6543218796, "213, Fossil Ferns, Pashan"),
("C103", "Sagar","Mathur", 7894362361, "401, Mont Vert, Baner"),
("C104", "Divya", "Kumar", 8745371287, "110, Aquila, Bavdhan"),
("C105", "Sanjana", "Mishra", 8867523091, "310, Serenity, Aundh"),
("C106", "Kajal", "Sharma", 8966345271, "501, Elite Galaxy, Baner"),
("C107", "Ravi", "Sethi", 6952345617, "402, Pebbles, Wakad"),
("C108", "Shyam", "Verma", 9712345309, "603, Nauka, Warje"),
("C109", "Siddh", "Shah", 6667321287, "204, Belle Vue, Swargate"),
("C110", "Aditya", "Singh", 9943267451, "504, Runwal Platinum, Bavdhan");

INSERT INTO supplier(Supp_id, FName, LName, SuppContact, SuppAddress)
VALUES
("S101", "Vasant", "Thakur", 6755901234, "Thakur Bakery, Camp, Pune"),
("S102", "Humza", "Ali", 8753904274, "12, Kudasan, Gandhinagar"),
("S103", "Pooja", "Dravid", 9267549832, "Dravid Dairy, Chembur, Mumbai"),
("S104", "Anjali", "Shah", 8856423419, "Morning Mist, Margodu, Coorg"),
("S105", "Rajat", "Kumar", 9987432123, "Kumar Industries, Bhosari, Pune"),
("S106", "Dhiraj", "Singh", 8985643521, "Singh Farms, Ville Parle, Mumbai"),
("S107", "Ashish", "Joshi", 9908745362, "Pearl vineyards, Indore"),
("S108", "Gautam", "Somani", 9967523415, "17, East Street, Indore"),
("S109", "Vedant", "Kulkarni", 7756434421, "Kulkarni Poultry, MG Road, Pune"),
("S110", "Ganga", "Mehta", 9812346650, "25, Kurla Complex, Mumbai");

INSERT INTO employee(Emp_id, FName, LName, EmpPosition, EmpContact, EmpAddress)
VALUES
("E101", "Kartik", "Agrawal", "Staff", 6666782319, "16, Rupali, Prabhat Road, Pune"),
("E102", "Shreyab", "Saini", "Manager", 6776782349, "104, Karishma Society, Vanaj, Pune"),
("E103", "Sanika", "Patil", "Staff", 9996753422, "201, Sahil Apartments, Warje, Pune"),
("E104", "Ketaki", "Patel", "Staff", 7272654121, "302, Fossil Ferns, Baner, Pune"),
("E105", "Dhruv", "Doshi", "Manager", 9960777243, "406, Animish, Wakad, Pune"),
("E106", "Sarthak", "Sharma", "Staff", 8854323789, "603, Aquila, Bavdhan, Pune"),
("E107", "Shantanu", "Kakade", "Owner", 7432234987, "102, Runwal Platinum, Pashan, Pune"),
("E108", "Devyani", "Khare", "Staff", 7498384472, "503, Kamayani, Aundh, Pune"),
("E109", "Kanishq", "Pore", "Staff", 8787234567, "204, Pebbles, Aundh, Pune"),
("E110", "Advait", "Kelkar", "Staff", 9879875643, "402, Serenity, Bavdhan, Pune");

INSERT INTO sales(SaleDate, CustID, ProdID)
VALUES
("2022-12-11 17:12:32", "C101", "P101"),
("2023-01-13 12:17:12", "C109", "P102"),
("2023-02-04 14:23:21", "C103", "P103"),
("2023-02-26 18:34:52", "C104", "P109"),
("2023-03-05 16:23:21", "C110", "P105"),
("2023-03-19 10:23:21", "C106", "P107"),
("2023-03-22 13:21:34", "C103", "P106"),
("2023-03-22 15:24:55", "C108", "P102"),
("2023-04-01 17:23:44", "C102", "P104"),
("2023-04-06 12:48:12", "C105", "P110");

INSERT INTO purchases(PurchaseDate, ProdID, SuppID)
VALUES
("2022-12-04 13:06:12", "P108", "S107"),
("2023-01-12 17:55:02", "P102", "S103"),
("2023-01-30 18:56:45", "P103", "S109"),
("2023-02-20 19:23:34", "P109", "S104"),
("2023-03-01 15:22:39", "P105", "S106"),
("2023-03-14 12:46:12", "P107", "S105"),
("2023-03-17 17:29:57", "P106", "S108"),
("2023-03-17 16:17:19", "P101", "S101"),
("2023-03-28 14:44:23", "P104", "S110"),
("2023-04-03 16:23:44", "P110", "S102");

INSERT INTO contain(Purchase_id, Prod_id, PurchasedQuantity)
VALUES
(1, "P108", 10),
(2, "P102", 22),
(3, "P103", 16),
(4, "P109", 15),
(5, "P105", 10),
(6, "P107", 20),
(7, "P106", 21),
(8, "P101", 12),
(9, "P104", 22),
(10, "P110", 13);

INSERT INTO supply(Purchase_id, Supp_id, BuyPrice)
VALUES
(1, "S107", 600),
(2, "S103", 30),
(3, "S109", 30),
(4, "S104", 150),
(5, "S106", 150),
(6, "S105", 65),
(7, "S108", 350),
(8, "S101", 24),
(9, "S110", 18),
(10, "S102", 80);

INSERT INTO partof(Sale_id, Cust_id, Emp_id)
VALUES
(1, "C101", "E101"),
(2, "C109", "E103"),
(3, "C103", "E104"),
(4, "C104", "E106"),
(5, "C110", "E108"),
(6, "C106", "E109"),
(7, "C103", "E110"),
(8, "C108", "E104"),
(9, "C102", "E108"),
(10, "C105", "E103");

INSERT INTO has(Sale_id, Prod_id, SoldQuantity)
VALUES
(1, "P101", 2),
(2, "P102", 2),
(3, "P103",1),
(4, "P109",1),
(5, "P105",1),
(6, "P107",2),
(7, "P106",1),
(8, "P102",4),
(9, "P104",2),
(10, "P110",3);
