select WELL_CHECKSHOT_DETAIL.ID as ID,
    WELL_CHECKSHOT_DETAIL.UWI as "Well ID",
    WELL_CHECKSHOT_DETAIL.SOURCE as Source,
    WELL_CHECKSHOT_DETAIL.SURVEY_TYPE as "Survey Type",
    WELL_CHECKSHOT_DETAIL.SURVEY_ID as "Survey ID",
    WELL_CHECKSHOT_DETAIL.SHOT_NUMBER as "Shot Number",
    WELL_CHECKSHOT_DETAIL.OBSERVED_TIME as "Two-Way Time",
    WELL_CHECKSHOT_DETAIL.GEOPHONE_MD as "Measured Depth",
    WELL_CHECKSHOT_DETAIL.VERTICAL_DEPTH as "Vertical Depth"
    from DBA.WELL_CHECKSHOT_DETAIL
    ORDER BY "Well ID"
    , "ID"
    , "Source"
    , "Shot Number"
    ;