select WELL_TEST.UWI as "Well ID",
    WELL_TEST.SOURCE as Source,
    WELL_TEST.TEST_TYPE as "Test Type",
    WELL_TEST.RUN_NUMBER as "Run Number",
    WELL_TEST.TEST_NUMBER as "DST ID",
    WELL_TEST.TEST_SUBTYPE as "Test Subtype",
    WELL_TEST.TOP_FORM as "Top Formation",
    WELL_TEST.GX_TOP_FORM_ALIAS as "Top Fm Alias",
    WELL_TEST.BASE_FORM as "Base Formation",
    WELL_TEST.GX_BASE_FORM_ALIAS as "Base Fm Alias",
    WELL_TEST.TOP_DEPTH as "Top Depth",
    WELL_TEST.BASE_DEPTH as "Base Depth",
    WELL_TEST.TOP_CHOKE_DESC as "Top Choke",
    WELL_TEST.BOTTOM_CHOKE_DESC as "Bottom Choke",
    WELL_TEST.REPORT_TEMP as Temperature,
    WELL_TEST.REMARK as Remarks,
    WELL_TEST.GX_RECORDER_DEPTH as "Recorder Depth",
    WELL_TEST.GX_CUSHION_VOL_OUOM as "Cushion OUOM",
    WELL_TEST.GX_CUSHION_VOL as "Cushion Volume",
    WELL_TEST.GX_CUSHION_TYPE as "Cushion Type"
    from DBA.WELL_TEST
    where(WELL_TEST.TEST_TYPE = 'DST') 
    ORDER BY "Well ID"
        , Source
        , "Test Type"
        , "Run Number"
        , "DST ID"
        ; 
