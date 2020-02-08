/*

    QUESTION #8::

        ...



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