select LEGAL_CARTER_LOC.LOCATION_ID as "Well ID",
    LEGAL_CARTER_LOC.LOCATION_TYPE as Type,LEGAL_CARTER_LOC.SOURCE as Source,
    LEGAL_CARTER_LOC.CARTER_RANGE as Range,
    LEGAL_CARTER_LOC.EW_DIRECTION as "E/W Direction",
    LEGAL_CARTER_LOC.CARTER_SECTION as Section,
    LEGAL_CARTER_LOC.CARTER_TOWNSHIP as Township,
    LEGAL_CARTER_LOC.MAP_QUAD_NAME as "Quad Name",
    LEGAL_CARTER_LOC.MAP_QUAD_MIN as "Quad Min",
    LEGAL_CARTER_LOC.NS_DIRECTION as "N/S Direction",
    LEGAL_CARTER_LOC.EW_START_LINE as "E/W Start Line",
    LEGAL_CARTER_LOC.EW_FOOTAGE as "E/W Footage",
    LEGAL_CARTER_LOC.NS_START_LINE as "N/S Start Line",
    LEGAL_CARTER_LOC.NS_FOOTAGE as "N/S Footage",
    LEGAL_CARTER_LOC.FOOTAGE_ORIGIN as Origin,
    LEGAL_CARTER_LOC.SPOT_CODE as "Spot Code",LEGAL_CARTER_LOC.COUNTY as County,
    LEGAL_CARTER_LOC.PROVINCE_STATE as State,
    LEGAL_CARTER_LOC.COUNTRY as Country,
    LEGAL_CARTER_LOC.REMARK as "Location Description"
    from dba.LEGAL_CARTER_LOC
    ORDER BY "Well ID"
    , "Type"
    ;