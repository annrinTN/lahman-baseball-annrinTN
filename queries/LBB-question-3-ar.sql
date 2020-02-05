/*
QUESTION #3 ::
   ... Find all players in the database who played at Vanderbilt University. 
   ... Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
   ... Sort this list in descending order by the total salary earned. 
   ... Which Vanderbilt player earned the most money in the majors?

        ...

    SOURCES ::

        ... people, salaries, schools, collegeplaying

    DIMENSIONS ::

        ... playerid firstname, lastneame from people
		... playerid, salary from salaries
		... playerid, schoolid from collegeplaying
		... schoolid, schoolname from schools

    FACTS ::

        * ...

    FILTERS ::

        ... Filter to Vanderbilt from schools
		...  link to collegeplaying to get playerid who went to Vandy
		.... link to salaries by playerid

DESCRIPTION ::

        ...



    ANSWER ::

        ...



*/

--people query without filters gives 19,112 player names
--attempt to use CTE to join player names from people to collegeplaying on playerid 
--then to schools on schoolid then to salaries on player id
WITH s1 AS (
SELECT DISTINCT p.playerid AS player, namefirst, namelast
FROM people AS p ),
--s2 gives 65 rows of Vandy players
s2 AS (
	SELECT schoolid, playerid AS player
FROM collegeplaying AS cp
WHERE schoolid LIKE 'vand%'),

s3 AS (
	SELECT playerid AS player, salary
FROM salaries AS s)

SELECT DISTINCT s1.player, s3.salary, schoolid
FROM s2
INNER JOIN s1
ON s1.player = s2.player
INNER JOIN s3
ON s2.player = s3.player

GROUP BY s1.player, s3.salary, schoolid 
ORDER BY s3.salary DESC;