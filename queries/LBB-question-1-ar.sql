/* Lahman-Baseball Project Ann Rumsey due 08-Feb-2019
Question # 1 
  **  What range of years does the provided database cover? **
  
    SOURCES ::
        * twenty-one or twenty-four tables have year

    DIMENSIONS ::
        * yearid is mostly consistent as a field name; year is used in homegames and debut is used in people

    FACTS ::
        * ...

    FILTERS ::
        * ...

    DESCRIPTION ::
        ...

    ANSWER ::
        ...
*/
-- Get INFORMATION_SCHEMA on public tables
-- Source help https://stackoverflow.com/questions/175415/how-do-i-get-list-of-all-tables-in-a-database-using-tsql
--SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' LIMIT 30;

-- Get INFORMATION_SCHEMA on base table with column data
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE 
TABLE_SCHEMA='public' 
--AND 
--column_name = yearid
--('year', 'yearid', 'debut')
--GROUP BY columns.column_name
ORDER BY column_name DESC, table_name;

/* get year columns and values

*/
WITH year AS 
(
	SELECT table_name, column_name, data_type
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE 
TABLE_SCHEMA='public' 