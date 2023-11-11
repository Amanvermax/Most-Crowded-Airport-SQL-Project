
/*  Find the country with the most passengers in the year 2018.  */


WITH CountryPassengerTotals AS (
  SELECT Country, SUM(Passengers) AS TotalPassengers
  FROM airport
  WHERE Year = 2018
  GROUP BY Country
)
SELECT Country, TotalPassengers
FROM CountryPassengerTotals
ORDER BY TotalPassengers DESC
LIMIT 1;


/* Find the top 5 airports with the highest gender diversity
(lowest ratio of male to female passengers) in the year 2017.*/


SELECT Year, Airport, Male, Female,
  CASE
    WHEN Female > 0 THEN (Male / Female)
    ELSE Male
  END AS GenderDiversity
FROM airport
WHERE Year = 2017
ORDER BY GenderDiversity ASC
LIMIT 5;


/* Calculate the percentage change in the number of passengers
 for each airport from 2016 to 2022.*/



WITH PassengerChange AS (
  SELECT Airport, ((MAX(Passengers) - MIN(Passengers)) / MIN(Passengers)) * 100 AS ChangePercentage
  FROM airport
  WHERE Year BETWEEN 2016 AND 2022
  GROUP BY Airport
)
SELECT Airport, ChangePercentage
FROM PassengerChange



/* Retrieve the airport with the highest number of passengers for each year.  */

SELECT Year, Ranks, Airport,Country
FROM airport a
WHERE (
  SELECT COUNT(*)
  FROM airport b
  WHERE b.Year = a.Year AND b.Passengers >= a.Passengers
) = 1;


/* Find the top 5 airports
 with the highest percentage of passengers above 50 in 2020.*/

WITH AgePercentage AS (
  SELECT Airport, (Age_above_50 / Passengers) * 100 AS Percentage
  FROM airport
  WHERE Year = 2020
)
SELECT Airport, Percentage
FROM AgePercentage
ORDER BY Percentage DESC
LIMIT 5;





/*--Countries with the Most Passengers in 2018 Here I am finding the countries with the most passengers in 2018.    */

WITH CountryPassengerTotals AS (
  SELECT Country, SUM(Passengers) AS TotalPassengers
  FROM airport
  WHERE Year = 2018
  GROUP BY Country
)
SELECT Country, TotalPassengers
FROM CountryPassengerTotals
ORDER BY TotalPassengers DESC;

/* --To find out how many total passengers traveled in economy_class and business_class in 2020, we can use the following SQL query     */


SELECT 
    SUM(CASE WHEN Year = 2020 THEN Economy_class ELSE 0 END) AS Total_Economy_Passengers2020,
    SUM(CASE WHEN Year = 2020 THEN Business_class ELSE 0 END) AS Total_Business_Passengers2020,
        SUM(CASE WHEN Year = 2019 THEN Economy_class ELSE 0 END) AS Total_Economy_Passengers2019,
    SUM(CASE WHEN Year = 2019 THEN Business_class ELSE 0 END) AS Total_Business_Passengers2019
FROM airport;



/* Finding the top 5 countries with the most airports.   */


SELECT Country, COUNT(Airport) AS AirportCount
FROM airport
where year=2016
GROUP BY Country
ORDER BY AirportCount DESC
LIMIT 5;





/*--Query to categorize airports by country into regions:*/



SELECT Year, Ranks, Airport, Location, Country,
  CASE
    WHEN Country IN ('United States', 'Canada', 'Mexico') THEN 'North America'
      WHEN Country IN ('Brazil') THEN 'South America'
    WHEN Country IN ('Germany', 'France','Russia', 'United Kingdom','Netherlands','Spain','Italy') THEN 'Europe'
     WHEN Country IN ('India', 'China', 'Japan','Philippines','Thailand','South Korea','United Arab Emirates','Qatar','Singapore','Hong kong') THEN 'Asia'
    ELSE 'Other'
  END AS Region
FROM airport;

/*Find pairs of airports in the same country by joining the "airport" table with itself (a1 and a2). Match rows where a1 and a2 have 
the same country and ensure that a1's airport is less than a2's airport to avoid duplicates or self-pairs.*/
 
       
SELECT a1.Airport AS Airport1, a2.Airport AS Airport2, a1.Country
FROM airport AS a1
JOIN airport AS a2 ON a1.Country = a2.Country
WHERE a1.Airport < a2.Airport
  AND a1.Year = 2018;
  
  
  
  /*This query identifies the year(s) with the highest number of business class passengers, matching the maximum count among all years in the provided data.
  */

WITH CTE AS 
(
SELECT Year, SUM(Passengers) as Total_passenger, SUM(Male) AS Total_male, 
       SUM(Female) AS Total_female, SUM(Economy_class) AS Total_economy_class , 
       SUM(Business_class) AS Total_business_class
FROM airport
    GROUP BY Year
    ORDER BY Year
)
SELECT * FROM CTE
    WHERE Total_business_class IN 
    (SELECT MAX(Total_business_class) FROM CTE);

/*
This query lists airports with above-average male passengers, ranked by descending male passenger count,
 identifying airports with a higher concentration of male passengers than the average.

*/

WITH CTE AS 
(
    SELECT Code, 
           SUM(Passengers) as Total_passenger, 
           SUM(Male) AS Total_male, 
           SUM(Female) AS Total_female, 
           SUM(Economy_class) AS Total_economy_class, 
           SUM(Business_class) AS Total_business_class
    FROM airport
    GROUP BY Code
)
SELECT *
FROM CTE
WHERE Total_male > (SELECT AVG(Total_male) FROM CTE)
ORDER BY Total_male DESC;

/*
The query identifies locations with the highest passenger traffic and orders them in descending order based on the total number of passengers.*/

WITH CTE AS 
(
    SELECT Location, 
           SUM(Passengers) as Total_passenger, 
           SUM(Male) AS Total_male, 
           SUM(Female) AS Total_female, 
           SUM(Economy_class) AS Total_economy_class, 
           SUM(Business_class) AS Total_business_class
    FROM airport
    GROUP BY Location
)
SELECT *
FROM CTE
ORDER BY Total_passenger DESC;






