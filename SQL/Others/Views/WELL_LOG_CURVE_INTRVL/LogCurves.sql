select WELL_LOG_CURVE_INTRVL.UWI as "Well ID",WELL_LOG_CURVE_INTRVL.SOURCE as Source,
    WELL_LOG_CURVE_INTRVL.JOB_ID as "Log Job ID",
    WELL_LOG_CURVE_INTRVL.LOG_RUN as "Log Run #",
    WELL_LOG_CURVE_INTRVL.CURVE_ID as "Log Curve",
    WELL_LOG_CURVE_INTRVL.PASS_NO as "Pass No.",
    WELL_LOG_CURVE_INTRVL.GX_CURVE_NAME as Name,
    WELL_LOG_CURVE_INTRVL.GX_CURVE_FORMAT as Format,
    WELL_LOG_CURVE_INTRVL.TOP_DEPTH as "Top Depth",
    WELL_LOG_CURVE_INTRVL.BASE_DEPTH as "Base Depth",
    WELL_LOG_CURVE_INTRVL.REMARK as Remark
    from DBA.WELL_LOG_CURVE_INTRVL
    ORDER BY "Well ID"
    , Source
    , "Log Job ID"
    , "Log Run #"
    , "Log Curve"
    , "Pass No."
    ;