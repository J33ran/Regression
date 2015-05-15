select WELL_TEST_PRESSURE.UWI as "Well ID",
    WELL_TEST_PRESSURE.TEST_TYPE as "Test Type",
    WELL_TEST_PRESSURE.TEST_NUMBER as "DST ID",
    WELL_TEST_PRESSURE.PERIOD_TYPE as "Pressure Type",
    WELL_TEST_PRESSURE.SOURCE as Source,
    WELL_TEST_PRESSURE.GX_DURATION as Duration,
    WELL_TEST_PRESSURE.START_PRESS as "Start Pressure",
    WELL_TEST_PRESSURE.END_PRESS as "End Pressure",
    WELl_TEST_PRESSURE.QUALITY_CODE as "Quality Code",
    WELL_TEST_PRESSURE.REMARK as Remarks,
    WELL_TEST_PRESSURE.RUN_NUMBER as "Run Number"
    from dba.WELL_TEST_PRESSURE
    where WELL_TEST_PRESSURE.TEST_TYPE = 'DST' 
    ORDER BY "Well ID"
    , "Test Type"
    , "Source"
    , "Pressure Type"
    , "Source"
    , "Run Number"
    ;