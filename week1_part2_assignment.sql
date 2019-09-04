-- Week 1 Part 2
SELECT a.faa, f.month, AVG(f.dep_time)
FROM airports a
LEFT JOIN flights f ON a.faa = f.origin
WHERE a.faa IN ('JFK', 'LGA', 'EWR')
AND f.year = 2013
GROUP BY a.faa;