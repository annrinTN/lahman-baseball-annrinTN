/*
    QUESTION #9 ::
       Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? 
	   Give their full name and the teams that they were managing when they won the award.
    SOURCES ::
        * managers, awardsmanagers, teams
    DIMENSIONS ::
      	* managers table: teamid, playerid, lgid, yearid, playermgr Y/N
		* awardsmanagers table: playerid, awardid, lgid, tie, yearid, notes
		* teams table: teamid, name (of team)
    FACTS ::
        * ...
    FILTERS ::
        * ...
    DESCRIPTION ::
       get award name from awardsmanagers with league, year and playerid (manager); 
	   join to managers table for team and year;
	   join to teams table for team name
    ANSWER ::
        ...
  
*/
--Separate NL and AL queries
-- AL only 
SELECT DISTINCT awardID, awm.playerID, awm.yearid, awm.lgID, mgr.teamid, t.name AS teamname
FROM awardsmanagers AS awm
   LEFT JOIN
   managers AS mgr
   ON mgr.playerid = awm.playerid
    LEFT JOIN
    teams AS t
    ON mgr.teamid = t.teamid
WHERE awardid = 'TSN Manager of the Year'
AND awm.lgid LIKE 'NL' 
ORDER BY awm.playerid, awm.yearid
;
--Separate NL and AL queries
-- NL only 
SELECT DISTINCT awardID, awm.playerID, awm.yearid, awm.lgID, mgr.teamid, t.name AS teamname
FROM awardsmanagers AS awm
   LEFT JOIN
   managers AS mgr
   ON mgr.playerid = awm.playerid
    LEFT JOIN
    teams AS t
    ON mgr.teamid = t.teamid
WHERE awardid = 'TSN Manager of the Year'
AND awm.lgid LIKE 'AL' 
ORDER BY awm.playerid, awm.yearid
;

-- CTE
WITH nl_sub AS
(
	SELECT DISTINCT awardID, awm.playerID, awm.yearid, awm.lgID, mgr.teamid, t.name AS teamname
FROM awardsmanagers AS awm
   LEFT JOIN
   managers AS mgr
   ON mgr.playerid = awm.playerid
    LEFT JOIN
    teams AS t
    ON mgr.teamid = t.teamid
WHERE awardid = 'TSN Manager of the Year'
AND awm.lgid LIKE 'NL' 
ORDER BY awm.playerid, awm.yearid
),
 
al_sub AS
(
SELECT DISTINCT awardID, awm.playerID, awm.yearid, awm.lgID, mgr.teamid, t.name AS teamname
FROM awardsmanagers AS awm
   LEFT JOIN
   managers AS mgr
   ON mgr.playerid = awm.playerid
    LEFT JOIN
    teams AS t
    ON mgr.teamid = t.teamid
WHERE awardid = 'TSN Manager of the Year'
AND awm.lgid LIKE 'AL' 
ORDER BY awm.playerid, awm.yearid
	)
SELECT tsn.playerid, tsn.lgid, tsn.awardid, al_sub.teamname, nl_sub.teamname, tsn.yearid
FROM
awardsmanagers AS tsn 
INNER JOIN nl_sub
ON  tsn.playerid = nl_sub.playerid
INNER JOIN al_sub
ON  tsn.playerid = al_sub.playerid
WHERE tsn.awardid = 'TSN Manager of the Year' AND al_sub.playerid = nl_sub.playerid
ORDER BY tsn.yearid
;

