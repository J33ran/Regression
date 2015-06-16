select WELL_LOG_TRIP.UWI as "Well ID",WELL_LOG_TRIP.SOURCE as Source,
    WELL_LOG_TRIP.JOB_ID as "Log Trip ID",WELL_LOG_TRIP.LOG_RUN as "Log Run #",
    WELL_LOG_TRIP.MUD_SAMPLE_ID as "Mud Sample ID",
    WELL_LOG_TRIP.MUD_SOURCE as "Mud Source",
    WELL_LOG_TRIP.MAX_DEPTH as "Logger Depth",WELL_LOG_TRIP.MAX_TEMP as "Max Temp"
    from DBA.WELL_LOG_TRIP
    ORDER BY "Well ID"
    , Source
    , "Log Trip ID"
    , "Log Run #"
    , "Mud Sample ID"
    , "Mud Source"
    ;