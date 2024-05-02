CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

CREATE TABLE Orders (
	OrderId int, 
	CustomerId int, 
	SalesmanId int, 
	Orderdate Date, 
	Amount money
);
INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

select * from Salesman 
select * from Customer
select * from Orders

--1 Insert a new record in your Orders table.
INSERT INTO Orders Values 
(5005,2645,102,'2023-04-20',50)

--2 Add Primary key constraint for SalesmanId column in Salesman table. Add default constraint for City column in Salesman table. 
-- Add Foreign key constraint for SalesmanId column in Customer table. Add not null constraint in Customer_name column for the Customer table.

ALTER TABLE Salesman alter column SalesmanId int NOT NULL --A primary key cannot be applied on a column with a null constraint 

Alter table Salesman
Add Primary key(SalesmanId);

Alter table Salesman
Add DEFAULT('Texas') for City;

Alter table Customer 
ADD CONSTRAINT FK_Salesman_SalesmanId Foreign key(SalesmanId) --didn't match with the values 
	REFERENCES Salesman(SalesmanId);

ALTER TABLE Customer alter column CustomerName Varchar(255) NOT NULL

--3 Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500.

select * from Customer where CustomerName Like '%n' And PurchaseAmount > 500

--4 Using SET operators, retrieve the first result with unique SalesmanId values from two tables, 
-- and the other result containing SalesmanId with duplicates from two tables.

SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Customer;

SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Customer;

--5 Display the below columns which has the matching data. Orderdate, Salesman Name, Customer Name, Commission, and City which has the
-- range of Purchase Amount between 500 to 1500.

select Orderdate, Name, CustomerName, Commission, City 
from Salesman
Join Customer
ON Salesman.SalesmanId = Customer.SalesmanId
Join Orders
ON Customer.SalesmanId = Orders.SalesmanId
WHERE PurchaseAmount between 500 AND 1500

--6 Using right join fetch all the results from Salesman and Orders table.

select * 
from Salesman
Right Join Orders
ON Salesman.SalesmanId = Orders.SalesmanId;
