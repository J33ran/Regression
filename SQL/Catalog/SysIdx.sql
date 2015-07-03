SELECT 
      I.index_name
    , TT.table_name
    FROM SYSIDX AS I
JOIN 
( 
    SELECT 
        T.table_id AS OID
        , T.table_name AS table_name
    FROM SYSTAB T
    KEY JOIN SYSUSER U
    WHERE U.user_name = 'DBA'
) AS TT
ON TT.OID = I.table_id
ORDER BY I.index_name, TT.table_name;
    