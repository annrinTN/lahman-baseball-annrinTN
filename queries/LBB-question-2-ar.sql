/*  QUESTION #2 :: 
	Find the name and height of the shortest player in the database. 
	How many games did he play in? 
	What is the name of the team for which he played?
        ...

    SOURCES :: people, appearances, teams tables

        * ... people joins to appearances on playerid, then teams joins to appearances on teamid

    DIMENSIONS ::

        * ...

    FACTS ::
          people table 
        * ...19,112 unique players concatenating playerid to firstname, lastname
		  ... Player height double precision type CAST as integer type AS height_inches
		  appearances table
		* ...
		  teams table
		* ...
FILTERS ::
        ... on people:: filter to 'MIN height' player and get his name and playerid: gaedeed01
		... on appearances:: filter to the shortest player in people on gaedeed01 playerid  
		    and get his g_all for all games played and teamid: SLA
		... on teams:: filter to the team id SLA and get team name

    DESCRIPTION ::

        ...



    ANSWER ::
    Find the name and height of the shortest player in the database? :: Eddie Gaudel, 43" tall
	How many games did he play in? :: One game
	What is the name of the team for which he played? :: St. Louis Browns
        ...
  WOO HOO!

*/
-- Name and Height of the shortest Player Eddie Gaedel gaedeed01 who is/ was 43" tall
SELECT CONCAT(namefirst, ' ', namelast, ' - ', playerid) AS player_name, CAST ( height AS integer) AS height_inches
FROM people
ORDER BY height_inches
LIMIT 1;
-- How many games did he play in? One
--UNION
SELECT playerid, teamid, g_all
FROM appearances
--ORDER BY g_all;
WHERE playerid = 'gaedeed01';
-- What is the name of the team he played for?
--UNION
SELECT DISTINCT teamid, name
FROM teams
WHERE teamid = 'SLA';
--How Many Games did the shortest player play and for which team name in one query?
/*SELECT player_name, teamid, g_all, height_inches
FROM appearances AS a
INNER JOIN p
ON p.playerid = a.playerid
    (  
	SELECT CONCAT(namefirst, ' ', namelast, ' - ', playerid) AS player_name, CAST ( height AS integer) AS height_inches
FROM people AS p
ORDER BY height_inches
LIMIT 1) AS sub;*/
