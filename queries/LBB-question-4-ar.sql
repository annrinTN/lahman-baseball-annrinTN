/*
QUESTION #4 ::
   ...  Using the fielding table, group players into three groups based on their position: 
   ...	label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", 
   ...	and those with position "P" or "C" as "Battery". 
   ...	Determine the number of putouts made by each of these three groups in 2016....

    SOURCES ::

        ... fielding

    DIMENSIONS ::

        ... playerid firstname, lastneame from fielding
	
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

SELECT yearid, 
    CASE WHEN pos LIKE 'of' AND yearid = 2016 THEN 'Outfield'
    WHEN pos LIKE 'ss' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE '1b' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE '2b' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE '3b' AND yearid = 2016 THEN 'Infield'
    WHEN pos LIKE 'p' AND yearid = 2016 THEN 'Battery'
	WHEN pos LIKE 'c' AND yearid = 2016 THEN 'Battery'
    ELSE 'Other'
    END AS position

FROM fielding
GROUP BY position, yearid
HAVING yearid = 2016


