/*

    QUESTION #8::
    Using the attendance figures from the homegames table, 
	find the teams and parks which had the top 5 average attendance per game in 2016 
	(where average attendance is defined as total attendance divided by number of games).
	Only consider parks where there were at least 10 games played. 
	Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

    SOURCES ::
        * homegames, teams and parks
    DIMENSIONS ::
        * team, park, attendance
		  INNER JOIN parks for park name and teams for team name
    FACTS ::
        Teams also needed to join on year to et correct team name for 2016
		 ** without that join Busch Stadium III had the top attendance for a park and the team St Louis Perfectos 
		 but those weren't the right teams in 2016
	==	 Actual top team was the LA Dodgers in Dodger Stadium
	==	 and the least was the Tampa Bay Rays in Tropicana Field
    
	FILTERS ::
        * year = 2016 on both homegames and teams tables and on games >10
    DESCRIPTION ::
        examples of multiple inner joins
    ANSWER ::
	    TOP FIVE attendance by TEAM
attendance_avg	team_name	            park_name
3703312     	Los Angeles Dodgers	    Dodger Stadium
3444490	        St. Louis Cardinals	    Busch Stadium III
3392099	        Toronto Blue Jays	    Rogers Centre
3365256	        San Francisco Giants	AT&T Park
3232420	        Chicago Cubs	        Wrigley Field

		
		TOP FIVE attendance by PARK
attendance_avg	park_name	        team_name
3703312	        Dodger Stadium	    Los Angeles Dodgers
3444490	        Busch Stadium III	St. Louis Cardinals
3392099	        Rogers Centre	    Toronto Blue Jays
3365256	        AT&T Park	         San Francisco Giants
3232420	        Wrigley Field	     Chicago Cubs

        LEAST attendance by TEAM
attendance_avg	team_name	        park_name
1286163	        Tampa Bay Rays	    Tropicana Field
1521506	        Oakland Athletics	Oakland-Alameda County Coliseum
1591667	        Cleveland Indians	Progressive Field
1712417	        Miami Marlins	    Marlins Park
1746293	        Chicago White Sox	U.S. Cellular Field
	   
		LEAST attendance by PARK
attendance_avg	park_name	                    team_name
1286163	        Tropicana Field	                Tampa Bay Rays
1521506	        Oakland-Alameda County Coliseum	Oakland Athletics
1591667	        Progressive Field	            Cleveland Indians
1712417	        Marlins Park	                Miami Marlins
1746293	        U.S. Cellular Field	            Chicago White Sox

*/
-- Check Table
SELECT *
FROM homegames;

--TOP FIVE attendance by Team
SELECT year, homegames.attendance / COUNT(games) AS attendance_avg,
teams.name AS team_name, park_name
FROM homegames
   INNER JOIN
   teams
   ON homegames.team = teams.teamid AND homegames.year = teams.yearid
   INNER JOIN
   parks
   ON homegames.park = parks.park
WHERE year = 2016 AND games > 10 
GROUP BY teams.name, year, park_name, homegames.attendance
ORDER BY attendance_avg DESC
LIMIT 5
;
-- TOP FIVE attendance by Park
SELECT year, homegames.attendance / COUNT(games) AS attendance_avg, 
park_name, teams.name AS team_name
FROM homegames
    INNER JOIN
	teams
	ON homegames.team = teams.teamid AND homegames.year = teams.yearid
    INNER JOIN
	parks
	ON homegames.park = parks.park
WHERE year = 2016 AND games > 10 
GROUP BY year, park_name, teams.name, homegames.attendance
ORDER BY attendance_avg DESC
LIMIT 5
;

-- LEAST FIVE ATTENDANCE by TEAM
SELECT year, homegames.attendance / COUNT(games) AS attendance_avg,
teams.name AS team_name, park_name
FROM homegames
   INNER JOIN
   teams
   ON homegames.team = teams.teamid AND homegames.year = teams.yearid
   INNER JOIN
   parks
   ON homegames.park = parks.park
WHERE year = 2016 AND games > 10 
GROUP BY teams.name, year, park_name, homegames.attendance
ORDER BY attendance_avg 
LIMIT 5
;
-- LEAST FIVE attendance by park
SELECT year, homegames.attendance / COUNT(games) AS attendance_avg, 
park_name, teams.name AS team_name
FROM homegames
    INNER JOIN
	teams
	ON homegames.team = teams.teamid AND homegames.year = teams.yearid
    INNER JOIN
	parks
	ON homegames.park = parks.park
WHERE year = 2016 AND games > 10 
GROUP BY year, park_name, teams.name, homegames.attendance
ORDER BY attendance_avg 
LIMIT 5
;