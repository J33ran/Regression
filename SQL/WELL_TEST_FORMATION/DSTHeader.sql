select WELL_TEST.UWI as "Well ID",
    WELL_TEST.TEST_NUMBER as "DST ID",
    WELL_TEST.TEST_TYPE as "Test Type",
    WELL_TEST.SOURCE as Source,
    WELL_TEST.RUN_NUMBER as "Run Number",
    WELL_TEST.TEST_SUBTYPE as "Test Subtype",
    WELL_TEST.TOP_DEPTH as "Top Depth",
    WELL_TEST.BASE_DEPTH as "Base Depth",
    WELL_TEST.TOP_FORM as "Top Formation",
    WELL_TEST.BASE_FORM as "Base Formation",
    WELL_TEST.REPORT_TEMP as Temperature,
    WELL_TEST.TOP_CHOKE_DESC as "Top Choke",
    WELL_TEST.BOTTOM_CHOKE_DESC as "Bottom Choke",
    WELL_TEST.TEST_DATE as "Test Date",
    WELL_TEST.REMARK as Remarks,
    WELL_TEST.GX_RECORDER_DEPTH as "Recorder Depth",
    WELL_TEST.GX_CUSHION_VOL_OUOM as "Cushion OUOM",
    WELL_TEST.GX_CUSHION_VOL as "Cushion Volume",
    WELL_TEST.GX_CUSHION_TYPE as "Cushion Type",
    WELL_TEST_FORMATION.FORM_ID as Formation,
    WELL_TEST_FORMATION.AGE_CODE as Age
    from dba.WELL_TEST
    left outer join dba.WELL_TEST_FORMATION on(WELL_TEST.UWI = WELL_TEST_FORMATION.UWI and WELL_TEST.TEST_NUMBER = WELL_TEST_FORMATION.TEST_NUMBER)
    where(WELL_TEST.TEST_TYPE = 'DST') 
    ORDER BY "Well ID"
    , Source
    , "Run Number"
    , "DST ID"
    , "Test Type"
    ;