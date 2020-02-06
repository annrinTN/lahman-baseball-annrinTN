/*
QUESTION #4 ::
   ...  Using the fielding table, group players into three groups based on their position: 
   ...	label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", 
   ...	and those with position "P" or "C" as "Battery". 
   ...	Determine the number of putouts made by each of these three groups in 2016....

    SOURCES ::

        ... fielding

    DIMENSIONS ::

        ... playerid yearid pos stint from fielding
	
    FACTS ::

        * ...

    FILTERS ::

        ... 
		...  

DESCRIPTION ::

        ...



    ANSWER ::

        ...


*/
SELECT *
FROM fielding;

SELECT yearid, SUM(po) AS putouts, COUNT(*),
    CASE WHEN pos LIKE 'OF' AND yearid = 2016 THEN 'Outfield'
    WHEN pos LIKE 'SS' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE '1B' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE '2B' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE '3B' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE 'S' AND yearid = 2016 THEN 'Battery'
	WHEN pos LIKE 'C' AND yearid = 2016 THEN 'Battery'
    ELSE 'Other'
    END AS position

FROM fielding
GROUP BY position, yearid
HAVING yearid = 2016;

SELECT playerid, pos, yearid, stint
FROM fielding;


