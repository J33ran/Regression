select WELL_TEST_FLOW.UWI as "Well ID",
    WELL_TEST_FLOW.SOURCE as Source,
    WELL_TEST_FLOW.TEST_TYPE as "Test Type",
    WELL_TEST_FLOW.TEST_NUMBER as "DST ID",
    WELL_TEST_FLOW.PERIOD_TYPE as "Period Type",
    WELL_TEST_FLOW.FLUID_TYPE as Fluid,
    WELL_TEST_FLOW.RUN_NUMBER as "Run Number",
    WELL_TEST_FLOW.MAX_FLUID_RATE as Amount,
    WELL_TEST_FLOW.MAX_FLUID_RATE_UOM as Unit,
    WELL_TEST_FLOW.TTS_ELASPED_TIME as Duration,
    WELL_TEST_FLOW.MAX_SURFACE_PRESS as Pressure,
    WELL_TEST_FLOW.REMARK as Remarks
    from dba.WELL_TEST_FLOW
    where WELL_TEST_FLOW.TEST_TYPE = 'DST'
    ORDER BY "Well ID"
    , Source
    , "Test Type"
    , "DST ID"
    , Fluid
    , "Run Number"
    ;