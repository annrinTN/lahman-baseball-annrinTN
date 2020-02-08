/*

    QUESTION #8::
    Using the attendance figures from the homegames table, 
	find the teams and parks which had the top 5 average attendance per game in 2016 
	(where average attendance is defined as total attendance divided by number of games).
	Only consider parks where there were at least 10 games played. 
	Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

    SOURCES ::

        * ...homegames



    DIMENSIONS ::

        * ...



    FACTS ::

        * ...



    FILTERS ::

        * ...



    DESCRIPTION ::

        ...



    ANSWER ::

        ...



*/



SELECT *

FROM homegames;

SELECT year, team, park, SUM(attendance) AS attendance, COUNT(games) AS eligible_games

FROM homegames
WHERE year = 2016 AND games > 10 
GROUP BY year, team, park;