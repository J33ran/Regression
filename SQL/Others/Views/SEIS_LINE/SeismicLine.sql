select SEIS_LINE.SEIS_ACQTN_SURVEY_ID as Program,
    SEIS_LINE.ACQTN_SURVEY_NAME as "Program Name",
    SEIS_LINE.SEIS_LINE_ID as "Line ID",SEIS_LINE.GX_YSCALE as "Vertical Scale",
    SEIS_LINE.GX_XSCALE as "Horizontal Scale",
    SEIS_LINE.GX_CONTRACTOR as Contractor,SEIS_LINE.GX_FOLD_LINE as Fold,
    SEIS_LINE.GX_FILTER as Filter,SEIS_LINE.GX_SPREAD as Spread,
    SEIS_LINE.GX_ENERGY_DESCRIPTION as "Energy Description",
    SEIS_LINE.GX_ENERGY_SOURCE as "Energy Source",
    SEIS_LINE.FIRST_SP_ID as "First SP ID",SEIS_LINE.LAST_SP_ID as "Last SP ID",
    SEIS_LINE.LAST_SP_LAT as "Last SP Lat",SEIS_LINE.LAST_SP_LONG as "Last SP Lng",
    SEIS_LINE.FIRST_SP_LAT as "First SP Lat",
    SEIS_LINE.FIRST_SP_LONG as "First SP Lng",
    SEIS_LINE.LINE_LENGTH as "Line Length",SEIS_LINE.LINE_NAME as Name,
    SEIS_LINE.STATION_TYPE as "Station Type",
    SEIS_LINE.GX_BULK_SHIFT as "Bulk Shift",
    SEIS_LINE.GX_DATUM_ELEVATION as "Datum Elevation",
    SEIS_LINE.GX_DATUM_VELOCITY as "Datum Velocity",
    SEIS_LINE.GX_ACQTN_SHOTPT_INTERVAL as "Shot Pt Interval",
    SEIS_LINE.GX_GROUP_INTERVAL as "Group Interval",
    SEIS_LINE.GX_RECORDING_DIR as "Recording Direction",
    SEIS_LINE.GX_AREA as "Project Area",SEIS_LINE.GX_CREW as Crew,
    SEIS_LINE.GX_DATE_SHOT as "Date",SEIS_LINE.GX_RECORDED_BY as "Recorded By",
    SEIS_LINE.GX_DESCRIPTION as Description,
    SEIS_LINE.GX_PAOFLAG as "PAO FLAG"
    from dba.SEIS_LINE
    ORDER BY "Program"
    , "Line ID"
    ;
