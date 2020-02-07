/*
QUESTION #5 ::
   ...  Find the average number of strikeouts per game by decade since 1920. 
   ...  Round the numbers you report to 2 decimal places. 
   ...  Do the same for home runs per game. 
   ...  Do you see any trends?
    
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

        ... validation -- spot check all years in a decade one by one



    ANSWER ::

        ... ten rows with ascending percentages each year starting with 25% strikeouts in 1920's up to 53% in the 2010's


*/
SELECT *
FROM batting;

--SELECT  yearid, SUM(so)/ SUM(g:: numeric(5, 2) ) AS strikeout_pct_game, SUM(g) AS games
WITH answer AS
(
SELECT 
   left(cast(yearid as varchar(4)), 3) || '0s' as decade,
   SUM(so) AS strikeouts, SUM(g) AS games
   --SUM(so)/ SUM(g:: numeric(5, 2) ) AS strikeout_pct_game
   FROM batting
   WHERE yearid >= 1920
   GROUP BY decade
   ORDER BY decade)
SELECT 
decade, ROUND((strikeouts :: numeric/ games:: numeric), 2) AS avg_so_game
FROM answer
   ;
 
