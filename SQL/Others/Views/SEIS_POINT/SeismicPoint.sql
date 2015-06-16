select SEIS_POINT.SEIS_ACQTN_SURVEY_ID as Program,
    SEIS_POINT.SEIS_LINE_ID as "Line ID",SEIS_POINT.SEIS_POINT_ID as "Point ID",
    SEIS_POINT.ELEV as Elevation,SEIS_POINT.X_COORDINATE as "X Coordinate",
    SEIS_POINT.Y_COORDINATE as "Y Coordinate",
    SEIS_POINT.SEIS_POINT_LAT as Latitude,
    SEIS_POINT.SEIS_POINT_LONG as Longitude
    from DBA.SEIS_POINT
    ORDER BY "Line ID"
    , "Point ID"
    , "Program"
    ;