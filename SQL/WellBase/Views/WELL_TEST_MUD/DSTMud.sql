select WELL_TEST_MUD.UWI as "Well ID",
    WELL_TEST_MUD.TEST_TYPE as "Test Type",
    WELL_TEST_MUD.TEST_NUMBER as "DST ID",
    WELL_TEST_MUD.MUD_TYPE as "Mud Type",
    WELL_TEST_MUD.SOURCE as Source,
    WELL_TEST_MUD.RUN_NUMBER as "Run Number",
    WELL_TEST_MUD.MUD_WEIGHT as Weight,
    WELL_TEST_MUD.MUD_VISCOSITY as Viscosity,
    WELL_TEST_MUD.MUD_RESISTIVITY as "Mud Resistivity",
    WELL_TEST_MUD.MUD_TEMP as "Mud Temperature",
    WELL_TEST_MUD.FILTRATE_RESISTIVITY as "Filtrate Resistivity",
    WELL_TEST_MUD.FILTRATE_TEMP as "Filtrate Temperature",
    WELL_TEST_MUD.GX_TRACER as Tracer,
    WELL_TEST_MUD.GX_WATER_LOSS as "Water Loss",
    WELL_TEST_MUD.GX_FILTER_CAKE_THICKNESS as "Filter Cake Thickness"
    from DBA.WELL_TEST_MUD 
    ORDER BY "Well ID"
    , "Test Type"
    , "DST ID"
    , "Source"
    , "Run Number"
    , "Mud Type"
    ;