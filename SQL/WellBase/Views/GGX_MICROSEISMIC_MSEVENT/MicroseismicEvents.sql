select a.UWI as "Well ID",
    a.EVENT_NO as "Event. No.",
    a.STAGE as Stage,
    a.EASTING as "X Offset",
    a.NORTHING as "Y Offset",
    a.DEPTH as Depth,
    a.SECONDS as "Event Time",
    a.MAGNITUDE as Magnitude,
    a.RADIUS as Radius,
    a.COLOR as Color,
    a.DIST_SD as "Distance STD",
    a.ANGLE_SD as "Angle STD",
    a.DEPTH_SD as "Depth STD",
    a.CNFDNO as "CNFD No",
    a.ANGLE_ERR as "Angle Error",
    a.DEPTH_ERR as "Depth Error",
    a.DIST_ERR as "Distance Error"
    from DBA.GGX_MICROSEISMIC_MSEVENT as a
    ORDER BY "Well ID"
    , "Event. No."
    , "Stage"
    , "Event Time"
    ;