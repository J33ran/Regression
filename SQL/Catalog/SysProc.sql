SELECT 
      P.proc_name
    , P.proc_defn
    , P.avg_num_rows
    , P.avg_cost
    , P.avg_cost
FROM SYSPROCEDURE P
KEY JOIN SYSUSER U
WHERE U.user_name = 'DBA'
ORDER BY P.Proc_name;