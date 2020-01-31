/* Lahman-Baseball Project Ann Rumsey due 08-Feb-2019
Question # 1 
  **  What range of years does the provided database cover? **
  
    SOURCES ::
        * twenty-four tables have year

    DIMENSIONS ::
        * Year is or is not consistent as a field name

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
--SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' LIMIT 10;
-- Get INFORMATION_SCHEMA on base table
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA='public' 
--AND column_name LIKE LOWER(%ear)
ORDER BY column_name DESC;