

SELECT * FROM SYSCHECK;

SELECT * FROM SYSCONSTRAINT ;

SELECT * FROM SYSTAB;

SELECT * FROM SYSUSER;

/*
table_name -- Table name
count -- Row count 
table_type --   
    1   Base table
    2   Materialized view
    3   Global temporary table
    4   Local temporary table
    5   Text index base table
    6   Text index global temporary table
    21   View

table_type_str -- Readable value for table_type. Values include:
    BASE   Base table
    MAT VIEW   Materialized view
    GBL TEMP   Global temporary table
    VIEW   View

*/
SELECT T.table_name
    , T.count 
    , T.table_type
    , T.table_type_str   
FROM SYSTAB T
KEY JOIN SYSUSER U
WHERE U.user_name = 'DBA'
ORDER BY T.table_name;


