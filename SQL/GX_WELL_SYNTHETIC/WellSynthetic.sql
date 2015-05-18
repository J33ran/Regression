select GX_WELL_SYNTHETIC.UWI as "Well ID",GX_WELL_SYNTHETIC.SOURCE as Source,
    GX_WELL_SYNTHETIC.SURVEY_ID as "Survey ID",GX_WELL_SYNTHETIC.NAME as Name,
    GX_WELL_SYNTHETIC.DESCRIPTION as Description,
    GX_WELL_SYNTHETIC.START_TIME as "Start Time",
    GX_WELL_SYNTHETIC.NUMBER_OF_POINTS as "Number of Points",
    GX_WELL_SYNTHETIC.SAMPLE_INCREMENT as "Sample Increment",
    GX_WELL_SYNTHETIC.GX_SYNTHETIC_BLOB as Array
    from dba.GX_WELL_SYNTHETIC
    ORDER BY "Well ID"
    , Source
    , "Survey ID"
    ;