--SEPARATE scripts to query column names, content defaults, types and ordinal position
--INFORMATION_SCHEMA for table '2.1'
SELECT table_name, column_name, column_default, data_type, ordinal_position
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'people'
ORDER BY column_name;

/* one script for all tables
USE lahman_baseball
GO
SELECT DB_NAME() AS Database_Name
, sc.name AS Schema_Name
, o.name AS Table_Name
, i.name AS Index_Name
, i.type_desc AS Index_Type
FROM sys.indexes i
INNER JOIN sys.objects o ON i.object_id = o.object_id
INNER JOIN sys.schemas sc ON o.schema_id = sc.schema_id
WHERE i.name IS NOT NULL
AND o.type = 'U'
ORDER BY o.name, i.type
*/

-- other try - used where table_schema = public
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'
