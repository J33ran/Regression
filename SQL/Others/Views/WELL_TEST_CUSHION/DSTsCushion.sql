select WELL_TEST_CUSHION.UWI as "Well ID",WELL_TEST_CUSHION.SOURCE as Source,
    WELL_TEST_CUSHION.TEST_TYPE as TEST_TYPE,
    WELL_TEST_CUSHION.TEST_NUMBER as "DST ID",
    WELL_TEST_CUSHION.CUSHION_VOL as "Cushion Amount",
    WELL_TEST_CUSHION.CUSHION_VOL_OUOM as Units,
    WELL_TEST_CUSHION.CUSHION_TYPE as "Cushion Type"
    from dba.WELL_TEST_CUSHION
    where(WELL_TEST_CUSHION.TEST_TYPE = 'DST')
    ORDER BY "Well ID"
    , Source
    , TEST_TYPE
    , "DST ID"
    ;