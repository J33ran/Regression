select a.UWI as PID,
    a.SURFACE_LATITUDE as LATITUDE,
    a.SURFACE_LONGITUDE as LONGITUDE,
    case when a.WELL_NAME is not null then WELL_NAME+' '+a.WELL_NUMBER else a.UWI
    end as NAME,a.WELL_NAME as Well_Name,
    a.WELL_NUMBER as well_number,
    a.OPERATOR as operator,
    a.CURRENT_STATUS as status,
    a.FINAL_TD as final_td,
    a.SPUD_DATE as spud_date,
    a.COMPLETION_DATE as comp_date,
    a.LEASE_NAME as lease_name,
    a.DEPTH_DATUM_ELEV as elev,
    a.PLUGBACK_DEPTH as plugback_depth,
    b.GX_BASE_LATITUDE as bh_latitude,
    b.GX_BASE_LONGITUDE as bh_longitude
    from DBA.WELL as a,DBA.WELL_DIR_SRVY as b
    where a.UWI = b.UWI
    ORDER BY PID;
