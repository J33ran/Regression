select SEIS_POINT.SEIS_ACQTN_SURVEY_ID as Program,
    SEIS_POINT.SEIS_LINE_ID as "Line ID",
    SEIS_POINT.SEIS_POINT_ID as "Point ID",
    SEIS_POINT.X_COORDINATE as "X Coordinate",
    SEIS_POINT.Y_COORDINATE as "Y Coordinate",
    SEIS_POINT.SEIS_POINT_LAT as Latitude,
    SEIS_POINT.SEIS_POINT_LONG as Longitude,
    SEIS_POINT.ELEV as Elevation,
    SEIS_PICK.SEIS_PICK_ID as Event,
    SEIS_PICK.GX_SHIFT as Shift,
    SEIS_PICK.GX_SOURCE as Source,
    SEIS_PICK.SEIS_PICK_TYPE as Type,
    SEIS_PICK.GX_PHASE as Phase,
    SEIS_PICK.GX_FORMATION_ID as Formation,
    SEIS_PICK.GX_DEPTH as Depth,
    SEIS_PICK.GX_SS_DEPTH as "SS Depth",
    SEIS_PICK.GX_AMPLITUDE as Amplitude,
    SEIS_PICK.GX_TIME as "Time",
    SEIS_PICK.GX_AVG_VELOCITY as "Avg Velocity",
    SEIS_PICK.GX_CONFIDENCE as Confidence,
    SEIS_PICK.GX_CONTROL_PT as "Control Flag"
    from dba.SEIS_POINT left outer join dba.SEIS_PICK
    on SEIS_POINT.SEIS_ACQTN_SURVEY_ID = SEIS_PICK.SEIS_ACQTN_SURVEY_ID
    and SEIS_POINT.SEIS_LINE_ID = SEIS_PICK.SEIS_LINE_ID
    and SEIS_POINT.SEIS_POINT_ID = SEIS_PICK.SEIS_POINT_ID
    ORDER BY Program
    , "Line ID"
    , "Point ID"
    , "Event"
    ;