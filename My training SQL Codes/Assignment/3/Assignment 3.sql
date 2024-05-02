select * from Jomato

--1 Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.

create Procedure display
as
select RestaurantName, RestaurantType , CuisinesType, TableBooking from Jomato where not TableBooking = 0

exec display

--2 Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.

select CuisinesType from Jomato where CuisinesType = 'Cafe'

begin transaction
update Jomato set CuisinesType = 'Cafeteria' where CuisinesType = 'Cafe'

rollback transaction --rolled back

select CuisinesType from Jomato where CuisinesType = 'Cafe'

--3 Generate a row number column and find the top 5 areas with the highest rating of restaurants.

SELECT Top 5  ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNumber,
RestaurantName, CuisinesType, Rating from Jomato

--4 Use the while loop to display the 1 to 50.
Declare @n as Int = 1;

WHILE @n<=50
BEGIN
   print @n;
   SET @n = @n+1;
END

--5 Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
create view Top_rating As
SELECT Top 5 * from Jomato ORDER BY Rating DESC

select * from Top_rating

--6 Create a trigger that give an message whenever a new record is inserted

CREATE TRIGGER RecordInserted
ON Jomato
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Message NVARCHAR(100);
    SET @Message = 'New record inserted!';
    
    PRINT @Message;
END;

INSERT INTO Jomato Values(
7845, 'Singh Kitchen', 'Fine Dining', 5, 4000, 6000, 34, 5, 'North Indian', 'WhiteField', 'West Bangalore', 50)