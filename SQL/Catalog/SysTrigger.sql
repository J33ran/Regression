SELECT 
      T.trigger_name
    , TT.table_name
    , T.trigger_defn   
    , T.source
    FROM SYSTRIGGER AS T
JOIN 
( 
    SELECT T.table_id AS OID
    , T.table_name as table_name
    FROM SYSTAB T
    KEY JOIN SYSUSER U
    WHERE U.user_name = 'DBA'
) AS TT
ON TT.OID = T.table_id
ORDER BY T.trigger_name, TT.table_name;