select WELL_TEST_FORMATION.UWI as "Well ID",WELL_TEST_FORMATION.SOURCE as Source,
    WELL_TEST_FORMATION.RUN_NUMBER as "Run Number",
    WELL_TEST_FORMATION.TEST_TYPE as Type,
    WELL_TEST_FORMATION.TEST_NUMBER as "DST ID",
    WELL_TEST_FORMATION.FORM_ID as Formation,
    WELL_TEST_FORMATION.GX_FORM_ID_ALIAS as Lithology,
    WELL_TEST_FORMATION.AGE_CODE as "Age Code"
    from dba.WELL_TEST_FORMATION 
    ORDER BY "Well ID"
    , "Source"
    , "Run Number"
    , "DST ID"
    , "Type"
    , "Formation"
    ;