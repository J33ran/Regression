SELECT C.constraint_name 
       , TT.table_name
FROM SYSCONSTRAINT AS C
JOIN 
( 
SELECT 
    T.object_id AS OID
    , T.table_name as table_name
    
FROM SYSTAB T
KEY JOIN SYSUSER U
WHERE U.user_name = 'DBA'
) AS TT
ON TT.OID = C.table_object_id
ORDER BY C.constraint_name, TT.table_name;
