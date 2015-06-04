select FAULT.FAULT_ID as Fault,R_SOURCE.SOURCE as Source
    from DBA.FAULT,DBA.R_SOURCE
    ORDER BY Source,Fault;
