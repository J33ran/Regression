select WELL_TEST_ANALYSIS.UWI as "Well ID",WELL_TEST_ANALYSIS.SOURCE as Source,
    WELL_TEST_ANALYSIS.TEST_TYPE as "Test Type",
    WELL_TEST_ANALYSIS.RUN_NUMBER as "Run Number",
    WELL_TEST_ANALYSIS.TEST_NUMBER as "DST ID",
    WELL_TEST_ANALYSIS.ANALYSIS_OBS_NO as "Analysis Obs",
    WELL_TEST_ANALYSIS.FLUID_TYPE as "Fluid Type",
    WELL_TEST_ANALYSIS.PERIOD_TYPE as "Period Type",
    WELL_TEST_ANALYSIS.GX_FLUID_PERCENT as "Fluid Pct",
    WELL_TEST_ANALYSIS.GOR as GOR,WELL_TEST_ANALYSIS.H2S_PCT as "H2S Pct",
    WELL_TEST_ANALYSIS.SULPHUR_PCT as "Sulphur Pct",
    WELL_TEST_ANALYSIS.WATER_TEMP as "Water Temp",
    WELL_TEST_ANALYSIS.WATER_RESISTIVITY as Rw,
    WELL_TEST_ANALYSIS.OIL_GRAVITY as "Oil Gravity",
    WELL_TEST.TOP_DEPTH as "Top Depth",WELL_TEST_FORMATION.FORM_ID as Formation,
    WELL_TEST_FORMATION.AGE_CODE as Age
    from dba.WELL_TEST_ANALYSIS join dba.WELL_TEST on(WELL_TEST_ANALYSIS.UWI = WELL_TEST.UWI and WELL_TEST_ANALYSIS.TEST_NUMBER = WELL_TEST.TEST_NUMBER and WELL_TEST_ANALYSIS.TEST_TYPE = WELL_TEST.TEST_TYPE) left outer join dba.WELL_TEST_FORMATION on(WELL_TEST_ANALYSIS.UWI = WELL_TEST_FORMATION.UWI and WELL_TEST_ANALYSIS.TEST_NUMBER = WELL_TEST_FORMATION.TEST_NUMBER)
    where WELL_TEST_ANALYSIS.TEST_TYPE = 'DST'
    ORDER BY "Well ID"
        , "Test Type"
        , "Run Number"
        , "DST ID"
        , "Fluid Type"
        , Source;
