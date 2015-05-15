select WELL_TEST_RECOVERY.UWI as "Well ID",
    WELL_TEST_RECOVERY.TEST_TYPE as "Test Type",
    WELL_TEST_RECOVERY.TEST_NUMBER as "DST ID",WELL_TEST_RECOVERY.SOURCE as Source,
    WELL_TEST_RECOVERY.RECOVERY_METHOD as Method,
    WELL_TEST_RECOVERY.RECOVERY_AMT as Amount,
    WELL_TEST_RECOVERY.RECOVERY_AMT_UOM as Unit,
    WELL_TEST_RECOVERY.RECOVERY_TYPE as Description,
    WELL_TEST_RECOVERY.REMARK as Remarks,
    WELL_TEST_RECOVERY.RECOVERY_OBS_NO as "Obs. No.",
    WELL_TEST_RECOVERY.RUN_NUMBER as "Run Number",
    WELL_TEST_FORMATION.FORM_ID as Formation,WELL_TEST_FORMATION.AGE_CODE as Age,
    WELL_TEST.TOP_DEPTH as Depth from dba.WELL_TEST
    ,dba.WELL_TEST_RECOVERY left outer join dba.WELL_TEST_FORMATION on(WELL_TEST_RECOVERY.UWI = WELL_TEST_FORMATION.UWI and WELL_TEST_RECOVERY.TEST_NUMBER = WELL_TEST_FORMATION.TEST_NUMBER)
    where WELL_TEST.UWI = WELL_TEST_RECOVERY.UWI and WELL_TEST.TEST_NUMBER = WELL_TEST_RECOVERY.TEST_NUMBER and WELL_TEST_RECOVERY.TEST_TYPE = 'DST' and WELL_TEST.TEST_TYPE = 'DST'
    and WELL_TEST_RECOVERY.RECOVERY_METHOD = 'PIPE'
    ORDER BY "Well ID"
    , Source
    , "Run Number"
    , "DST ID"
    , "Test Type"
    ;
