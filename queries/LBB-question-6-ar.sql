/*

    QUESTION #6 ::

        Find the player who had the most success stealing bases in 2016, 
		where success is measured as the percentage of stolen base attempts which are successful. 
		(A stolen base attempt results either in a stolen base or being caught stealing.) 
		Consider only players who attempted at least 20 stolen bases.

    SOURCES ::

        * ... batting table



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
FROM batting;

-- 1483 row count
-- need subquery for the player pool
SELECT playerid, yearid, 
g AS games, 
sb AS stolen_base, 
cs AS caught_stealing_base, 
sb+cs AS total_attempts,
--ROUND((sb/(sb+cs)), 2) AS pct_success
sb :: numeric /(sb :: numeric + cs :: numeric)  AS success,
   (SELECT (namefirst || ( namelast)) AS player_name
   FROM people
   WHERE people.playerid = batting.playerid) AS subquery
FROM batting 
WHERE 
sb+cs >20
AND yearid = 2016
ORDER BY success DESC
LIMIT 1 ;
