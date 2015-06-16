select WELL_CORE_DESCRIPTION.UWI as "Well ID",WELL_CORE_DESCRIPTION.SOURCE as Source,
    WELL_CORE_DESCRIPTION.CORE_ID as "Core ID",
    well_core_DESCRIPTION.show_type as "Show Type",
    well_core_DESCRIPTION.lithology_desc as Lithology
    from dba.WELL_CORE_DESCRIPTION 
    ORDER BY "Well ID"
    , Source
    , "Core ID"
    ;
