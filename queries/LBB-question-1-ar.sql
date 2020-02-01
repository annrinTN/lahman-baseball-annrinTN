/* Lahman-Baseball Project Ann Rumsey due 08-Feb-2019
Question :: # 1 
  **  What range of years does the provided database cover? **
  
    SOURCES ::
        * batting, fielding, pitching tables
		...these three are the main data tables with yearid
		...four tables do ot have have year columns

    DIMENSIONS ::
        * ...

    FACTS ::
        * ... yearid is mostly consistent as a field name and is an integer; 
		... field name 'year' is used in homegames and 'debut' is used in people

    FILTERS ::
        * ... MIN (yearid) and MAX(yearid)

    DESCRIPTION ::
        ... get year columns and min / max values from batting, fielding, pitching as the main tables mentioned in the readme
		... Validate each table has the same
        ... Build one row for visualization

    ANSWER :: years 1871 to 2016
        ...
*/
SELECT MIN(min_year), MAX (max_year)
FROM
(
SELECT min(yearid) AS min_year, max(yearid) AS max_year
FROM batting 
UNION ALL
SELECT min(yearid) AS min_year, max(yearid) AS max_year
FROM fielding 
UNION ALL
SELECT min(yearid) AS min_year, max(yearid) AS max_year
FROM pitching)
AS sub; 

