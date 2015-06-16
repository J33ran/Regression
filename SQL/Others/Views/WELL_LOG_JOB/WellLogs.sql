select WELL_LOG_JOB.UWI as "Well ID",WELL_LOG_JOB.SOURCE as Source,
    WELL_LOG_JOB.JOB_ID as "Log Job ID",
    WELL_LOG_JOB.LOGGING_COMPANY as "Logging Company",
    WELL_LOG_JOB.START_DATE as "Start Date",WELL_LOG_JOB.END_DATE as "End Date"
    from DBA.WELL_LOG_JOB
    ORDER BY "Well ID"
    , Source
    , "Log Job ID"
    ;