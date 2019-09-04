-- 1. How many airplanes have listed speeds?
SELECT COUNT(*) FROM flights.planes
WHERE speed IS NOT NULL; -- Answer: 23

-- What is the minimum listed speed and the maximum listed speed?
SELECT MAX(speed) FROM flights.planes; -- Answer: 432
SELECT MIN(speed) FROM flights.planes; -- Answer: 90

-- 2. What is the total distance flown by all of the planes in January 2013? 
SELECT SUM(distance) FROM flights.flights
WHERE year = 2013
AND month = 1; -- Answer: 27,188,805

-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT SUM(distance) FROM flights.flights
WHERE year = 2013 
AND tailnum IS NULL; -- Answer: 0
/*
 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 
 Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
*/
SELECT p.manufacturer, SUM(f.distance) FROM flights.flights f
INNER JOIN flights.planes p ON p.tailnum = f.tailnum 
WHERE f.year = 2013
AND f.month = 7
AND f.day = 5
GROUP BY p.manufacturer;

SELECT p.manufacturer, SUM(f.distance) FROM flights.flights f
LEFT OUTER JOIN flights.planes p ON p.tailnum = f.tailnum 
WHERE f.year = 2013
AND f.month = 7
AND f.day = 5
GROUP BY p.manufacturer;

/*
Total distances are reduced significanly when using LEFT OUTER JOIN as only the unique records in the flights table are considers. 
The inner join records as well as all plane records are ignored.
*/

-- 4. Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database.
-- Find average departure delay of airlines that own BOEING planes.
SELECT l.name AS airline, f.flight AS flight_Number, f.dep_delay AS Departure_Delay, p.manufacturer
FROM airlines l
LEFT JOIN flights f ON f.carrier = l.carrier
LEFT JOIN planes p ON p.tailnum = f.tailnum
WHERE p.manufacturer = 'BOEING';