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
        * ... team, park, attendance



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

SELECT year, team, SUM(homegames.attendance) AS attendance, COUNT(games) AS eligible_games,
SUM(homegames.attendance) OVER (PARTITION BY team) AS attendance_avg,
teams.name AS team_name
FROM homegames
   INNER JOIN
   teams
   ON homegames.team = teams.teamid
WHERE year = 2016 AND games > 10 
GROUP BY year, team, homegames.attendance,  teams.name
ORDER BY attendance_avg DESC
LIMIT 5
;

SELECT year, park, SUM(attendance) AS attendance, COUNT(games) AS eligible_games,
SUM(attendance) OVER (PARTITION BY park) AS attendance_avg
FROM homegames
WHERE year = 2016 AND games > 10 
GROUP BY year, park, homegames.attendance
ORDER BY homegames.attendance DESC
LIMIT 5
;