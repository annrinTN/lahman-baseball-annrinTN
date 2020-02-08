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
        * ...teams table
    DIMENSIONS ::
        * ... w, l, g, wswin, name, yearid
    FACTS ::
        * ... 1981 was a short season
    FILTERS ::
        * ... yerid >= 1970 and wswin NOT NULL then either Y or N
    DESCRIPTION ::
        ... used rank to determine the most and least wins by year 
    ANSWER ::
        ...largest number of wins / team didn't win the world series
		:: 2001 Seattle Mariners 116 wins in 162 games
		
		...smallest number of wins / team did win the world series
		:: 1981 Los Angeles Dodgers 63 wins in only 110 games
		:: 2006 St Louis Cardinals 83 wins in 161 games

        ... How often did the team with the most wins win the world series / what percent of the time
        :: Once - the 1998 New York Yankees with 114 wins
*/

SELECT DISTINCT wswin
FROM teams;
SELECT 
     CASE WHEN wswin  = 'Y' THEN 1
     ELSE '0'
	 END AS world_series_wins, 
yearid, name AS team, SUM(g) AS games, 
SUM(w) AS wins, sum(l) AS losses,
RANK () OVER(ORDER BY SUM(w) )AS least_wins_rank,
RANK () OVER(ORDER BY SUM(w) DESC) AS most_wins_rank
FROM teams
WHERE yearid>=1970 AND wswin IS NOT NULL AND wswin <> 'N'
GROUP BY name, yearid, wswin
ORDER BY least_wins_rank 
LIMIT 2; -- DID WIN the World Series with the smallest number of wins

SELECT DISTINCT wswin
FROM teams;
SELECT 
     CASE WHEN wswin  = 'Y' THEN 1
     ELSE '0'
	 END AS world_series_wins, 
yearid, name AS team, SUM(g) AS games, 
SUM(w) AS wins, sum(l) AS losses,
RANK () OVER(ORDER BY SUM(w) )AS least_wins_rank,
RANK () OVER(ORDER BY SUM(w) DESC) AS most_wins_rank
FROM teams
WHERE yearid>=1970 AND wswin IS NOT NULL AND wswin <> 'Y'
GROUP BY name, yearid, wswin
ORDER BY most_wins_rank 
LIMIT 1; -- DID NOT WIN the World Series with the largest number of wins

SELECT DISTINCT wswin
FROM teams;
SELECT 
     CASE WHEN wswin  = 'Y' THEN 1
     ELSE '0'
	 END AS world_series_wins, 
yearid, name AS team, SUM(g) AS games, 
SUM(w) AS wins, sum(l) AS losses,
RANK () OVER(ORDER BY SUM(w) )AS least_wins_rank,
RANK () OVER(ORDER BY SUM(w) DESC) AS most_wins_rank
FROM teams
WHERE yearid>=1970 AND wswin IS NOT NULL AND wswin <> 'N'
GROUP BY yearid, wswin, name
ORDER BY most_wins_rank 
; -- How often DID WIN the World Series with the largest number of wins