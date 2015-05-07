select WELL_DIR_PROPOSED_SRVY_STATION.UWI as "Well ID",
    WELL_DIR_PROPOSED_SRVY_STATION.SOURCE as Source,
    WELL_DIR_PROPOSED_SRVY_STATION.SURVEY_ID as "Survey ID",
    WELL_DIR_PROPOSED_SRVY_STATION.STATION_MD as MD,
    WELL_DIR_PROPOSED_SRVY_STATION.STATION_ID as "Survey Point Number",
    WELL_DIR_PROPOSED_SRVY_STATION.STATION_TVD as TVD,
    WELL_DIR_PROPOSED_SRVY_STATION.INCLINATION as Inclination,
    WELL_DIR_PROPOSED_SRVY_STATION.AZIMUTH as Azimuth,
    WELL_DIR_PROPOSED_SRVY_STATION.Y_OFFSET as "N/S Offset",
    WELL_DIR_PROPOSED_SRVY_STATION.X_OFFSET as "E/W Offset",
    WELL_DIR_PROPOSED_SRVY_STATION.GX_STATION_LATITUDE as "Lat/Y",
    WELL_DIR_PROPOSED_SRVY_STATION.GX_STATION_LONGITUDE as "Long/X",
    DBA.SRVYCLOSURE(WELL_DIR_PROPOSED_SRVY_STATION.X_OFFSET,WELL_DIR_PROPOSED_SRVY_STATION.Y_OFFSET) as Closure,
    WELL_DIR_PROPOSED_SRVY_STATION.GX_DLS as DLS
    from DBA.WELL_DIR_PROPOSED_SRVY_STATION 
    ORDER BY "Well ID";
