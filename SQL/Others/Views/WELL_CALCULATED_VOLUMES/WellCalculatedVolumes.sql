select a.UWI as "Well ID",
    a.SOURCE as Source,
    a.ACTIVITY_TYPE as "Activity Type",
    a.ZONE_ID as "Zone Alias",
    a.VOLUME_METHOD as "Summary Type",
    a.OIL_EUR as "Oil EUR",
    a.OIL_RESERVES as "Oil Reserves",
    a.GAS_EUR as "Gas EUR",
    a.GAS_RESERVES as "Gas Reserves",
    a.USER_PARAMS as USER_PARAMS
    from dba.WELL_CALCULATED_VOLUMES as a
    ORDER BY "Well ID"
    , Source
    , "Zone Alias"
    , ACTIVITY_TYPE
    , VOLUME_METHOD
    ;