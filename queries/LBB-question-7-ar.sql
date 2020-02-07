/*

    QUESTION #  7::

        ...From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
		What is the smallest number of wins for a team that did win the world series? 
		Doing this will probably result in an unusually small number of wins for a world series champion 
		– determine why this is the case. 
		Then redo your query, excluding the problem year. 
		How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 
		What percentage of the time?



    SOURCES ::

        * ...



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
FROM teams;

SELECT yearid, name AS team, SUM(g) AS games, NOT NULL wswin, SUM(w) AS wins, sum(l) AS losses

FROM teams
WHERE yearid>=1970 
GROUP BY name, yearid
ORDER BY wswin DESC;