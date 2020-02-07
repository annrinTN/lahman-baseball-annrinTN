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

        ...



    ANSWER ::

        ...


*/
SELECT *
FROM batting;

SELECT 
yearid, so, g
FROM batting;
