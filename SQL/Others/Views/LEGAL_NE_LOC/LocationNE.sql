select LEGAL_NE_LOC.UWI as "Well ID",LEGAL_NE_LOC.LOCATION_TYPE as Type,
    LEGAL_NE_LOC.SOURCE as Source,LEGAL_NE_LOC.NE_DISTRICT as District,
    LEGAL_NE_LOC.REF_LONGITUDE as "Ref. Longitude",
    LEGAL_NE_LOC.REF_LATITUDE as "Ref. Latitude",
    LEGAL_NE_LOC.PROVINCE_STATE as State,
    LEGAL_NE_LOC.COUNTY as County,
    LEGAL_NE_LOC.REMARK as "Location Description"
    from dba.LEGAL_NE_LOC
    ORDER BY "Well ID"
    , "Type"
    ;