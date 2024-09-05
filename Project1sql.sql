create  database sqlPrjt1;
use sqlPrjt1;
create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(350),
NOC varchar(100),
Games varchar(500),
Year int,
Season varchar(400),
City varchar(300),
Sport varchar(500),
Event varchar(400),
Medal varchar(200));


show variables like "secure_file_priv";
select * from olympics;

load data infile "C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Athletes_Transformed.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics
limit 10
offset 200000;


-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select medal,count(*) as medalcount
from olympics
where medal <> 'NoMedal'
group by medal;

-- 2. Show count of unique sports present in Olympics

select Sport ,count(*)  
from olympics	
group by Sport; 																	

-- 3. Show how many different medals won by team India

select  medal,count(*) as medalcount, Team
from olympics
where medal <> 'NoMedal'and Team='India'
group by medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order


select Event,medal,count(*) as medalcount
from olympics
where medal <> 'NoMedal'  and Team='India'
group by event,medal
order by medalcount desc;

-- 5. Show event wise medals won by India in order of year
select Event,Year,medal
from olympics
where medal <> 'NoMedal'  and Team='India'
group by event,medal,Year
order by Year;

-- 6. show country who won maximum medals.

select Team,medal,count(*) as medalcount
from olympics 
where medal <> 'NoMedal'
group by Team,medal
order by medalcount desc;

-- 7.show top 10 countries whowon gold

select Team,medal,count(*) as medalcount
from olympics 
where medal ='Gold'
group by Team,medal
order by medalcount desc
limit 10;


--  8. show in which year did United states won most gold medal
select Team,Year,medal,count(*) as medalcount
from olympics
where medal ='Gold'  and Team='United States'
group by Team,medal,Year
order by medalcount desc;

-- 9. In which sports United States has most medals.
select Team,Sport,medal,count(*) as medalcount
from olympics
where medal <>'NoMedal'  and Team='United States'
group by Team,medal,Sport
order by medalcount desc;


-- 10. Find top three players who won most medals along with their sports and country
select * from olympics;


-- 11. Find player with most gold medals in cycling along with his country.



-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel





