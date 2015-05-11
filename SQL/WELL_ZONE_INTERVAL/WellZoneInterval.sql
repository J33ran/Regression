select WELL_ZONE_INTERVAL.UWI,WELL_ZONE_INTERVAL.ZONE_NAME,WELL_ZONE_INTERVAL.TOP_MD,
    WELL_ZONE_INTERVAL.BASE_MD,WELL_ZONE_INTERVAL.TOP_TVD,
    WELL_ZONE_INTERVAL.BASE_TVD,WELL_ZONE_INTERVAL.TOP_X,WELL_ZONE_INTERVAL.BASE_X,
    WELL_ZONE_INTERVAL.TOP_Y,WELL_ZONE_INTERVAL.BASE_Y,WELL_ZONE_INTERVAL.X,
    WELL_ZONE_INTERVAL.Y,WELL_ZONE_INTERVAL.TVD,WELL_ZONE_INTERVAL.MD,
    WELL_ZONE_INTERVAL.MDSS,WELL_ZONE_INTERVAL.TVDSS,WELL_ZONE_INTERVAL.REMARK
    from DBA.WELL_ZONE_INTERVAL
    ORDER BY UWI, ZONE_NAME;
