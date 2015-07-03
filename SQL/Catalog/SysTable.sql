SELECT T.table_name
    , T.count 
    , T.table_type
    , T.table_type_str   
FROM SYSTAB T
KEY JOIN SYSUSER U
WHERE U.user_name = 'DBA'
ORDER BY T.table_name,T.creator;


