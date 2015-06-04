select WELL_TEST.UWI as "Well ID",
    WELL_TEST.SOURCE as Source,
    WELL_TEST.RUN_NUMBER as "Run Number",
    WELL_TEST.TEST_NUMBER as "Test Number",
    WELL_TEST.TEST_SUBTYPE as Type,'N/A' as "Producing Zone",
    WELL_TEST.TOP_FORM as "Top Formation",
    WELL_TEST.TOP_DEPTH as "Top Depth",
    WELL_TEST.BASE_FORM as "Base Formation",
    WELL_TEST.BASE_DEPTH as "Base Depth",
    WELL_TEST.TEST_DATE as "Test Date",
    WELL_TEST.TEST_DURATION as "Test Duration",
    WELL_TEST.OIL_FLOW_AMT as "Oil Volume",
    WELL_TEST.MAX_OIL_FLOW_RATE as "Oil Rate",
    WELL_TEST.GAS_FLOW_AMT as "Gas Volume",
    WELL_TEST.MAX_GAS_FLOW_RATE as "Gas Rate",
    WELL_TEST.WATER_FLOW_AMT as "Water Volume",
    WELL_TEST.MAX_WATER_FLOW_RATE as "Water Rate",
    WELL_TEST.FLOW_PRESS as "Flow Pressure",
    WELL_TEST.MAX_HYDROSTATIC_PRESS as "BH Pressure",
    WELL_TEST.CHOKE_SIZE_DESC as Choke,
    WELL_TEST.REPORT_TEMP as "BH Temperature",
    WELL_TEST.OIL_GRAVITY as "Oil Gravity",
    DBA.GOR(WELL_TEST.GAS_FLOW_AMT,WELL_TEST.OIL_FLOW_AMT) as GOR,
    WELL_TEST.H2S_PCT as H2S,
    well_test.gx_co2_pct as CO2,
    WELL_TEST.SHUT_OFF_TYPE as "Shut Off Type",
    WELL_TEST.REMARK as Remarks,
    WELL_TEST.GX_Z_FACTOR as "Z Factor",
    WELL_TEST.GX_BHP_Z as "P/Z",
    WELL_TEST.GX_GAS_CUM as "Cum Gas",
    WELL_TEST.TEST_TYPE as "Test Type"
    from dba.WELL_TEST
    where(WELL_TEST.TEST_TYPE in( 'IP','I.P.','I. P.','I P') ) 
    ORDER BY "Well ID"
        , Source
        , "Run Number"
        , "Test Number"
        , "Test Type"
        ;
