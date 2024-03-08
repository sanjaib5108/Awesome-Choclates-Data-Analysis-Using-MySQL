-- Query 1. Select everything from sales table using SELECT Statement.
select * from sales;

-- Show just a few columns from sales table using SELECT Stament and specific columns from the table.
select SaleDate, Amount, Customers from sales;

select Amount, Customers, GeoID from sales;

-- Adding a calculated column with SQL. This will be calculated by dividing the Amont column by Boxes Column.
Select SaleDate, Amount, Boxes, Amount / Boxes  from sales;

-- Naming a field with AS in SQL. A new column will be created for the caliculated value of Amount / Boxes
Select SaleDate, Amount, Boxes, Amount / Boxes as 'Amount per box'  from sales;

-- Using WHERE Clause in SQL to find a specific value from the Database. Here the condition is amount greater than 10000.
select * from sales where amount > 10000 order by amount;

-- Showing sales data where amount is greater than 10,000 by descending order
select * from sales where amount > 10000 order by amount desc;

-- Showing sales data where geography is g1 by product ID &
-- descending order of amounts

select * from sales
where geoid='g1'
order by PID, Amount desc;

-- Working with dates in SQL

Select * from sales
where amount > 10000 and SaleDate >= '2022-01-01';

-- Using year() function to select all data in a specific year

select SaleDate, Amount from sales
where amount > 10000 and year(SaleDate) = 2022
order by amount desc;

-- BETWEEN condition in SQL with < & > operators

select * from sales
where boxes >0 and boxes <=50;

-- Using the between operator in SQL. This query will show all the sale transactions where the
-- Number of Boxes are between 0 and 50, and will show by Boxes in Ascending Order.

select * from sales
where boxes between 0 and 50
order by Boxes;

-- Using weekday() function in SQL

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of the Week'
from sales where weekday(SaleDate) = 4;

-- Working with People table

select * from people;

-- Query to find the people who do not belong to either Delish, Jucies or Yummies Team.

select * from people where team not in ('Delish','Jucies','Yummies');

-- OR operator in SQL to find the people who work in the team of Delish and Juices

select * from people
where team = 'Delish' or team = 'Jucies';

-- IN operator in SQL to find the people who work in the team of Yummies and Delish.

select * from people
where team in ('Delish','Yummies');

-- LIKE operator in SQL. This query will pick all the Sales Person details 
-- whose name starts with letter 'B'.

select * from people
where salesperson like 'B%';

-- LIKE operator in SQL. This query will pick all the Sales Person details 
-- whose name has the letter 'B'.

select * from people
where salesperson like '%B%';

select * from sales;

-- Using CASE to create branching logic in SQL

select 	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount Category'
from sales;

-- GROUP BY in SQL

select team, count(*) as NumberOfMembers from people
group by team;