-- Irregular data corrected in excel to make import possible
select * from Jomato

select * from Jomato where RestaurantName Like '%Quick%'

--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

create function stufuf (@chi as Varchar(40))
Returns Varchar(40)
AS
Begin
Return(
SELECT STUFF (@chi, 6, 1, ' Chicken ')
)
end

select dbo.stufuf('Quick Bites')

--2 Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

create function rating(@numo as int)
Returns Table
AS

Return(
SELECT Top (@numo) RestaurantName, CuisinesType, Rating from Jomato Order by Rating DESC

)

select * from dbo.rating(5) 

--3 Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, ‘Good’ if it has above 3.5
-- and below 4 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating

select *, Rating_Status = 
case
when Rating>4 then 'Excellent'
when Rating<4 AND Rating>=3.5  then 'Good'
when Rating<3.5 AND Rating>=3 then 'Average'
when Rating<3 then 'Bad'
else 'Null'
end
from Jomato

--4 Find the Ceil, floor and absolute values of the rating column and display the current date and separately display the year, month_name and day.
SELECT 
    RestaurantName, Rating,
    CEILING(Rating) AS CeilRating,
    FLOOR(Rating) AS FloorRating,
    ABS(Rating) AS AbsoluteRating,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS [Year],
    DATENAME(MONTH, GETDATE()) AS [MonthName],
    DAY(GETDATE()) AS [Day]
FROM Jomato;

--Display the restaurant type and total average cost using rollup.

Select RestaurantType, AVG(AverageCost) AS TOTAL_AVERAGE_COST
From Jomato
Group BY ROllup(RestaurantType)

