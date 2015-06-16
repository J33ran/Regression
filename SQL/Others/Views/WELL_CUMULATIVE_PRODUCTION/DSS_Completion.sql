select a.UWI as WellID,
    a.ZONE_ID as ZoneID,
    MAX(isnull(b.GX_FORM_TOP_DEPTH, 0)) as MD,
    a.UWI+'_'+a.ZONE_ID as PID,
    a.UWI+'_'+a.ZONE_ID as NAME,
    (select a.SURFACE_LATITUDE from DBA.WELL as a where a.UWI = b.UWI) as SURFACEY,
    (select a.SURFACE_LONGITUDE from DBA.WELL as a where a.UWI = b.UWI) as SURFACEX,
    (select a.CURRENT_STATUS from DBA.WELL as a where a.UWI = b.UWI) as STATUS
    from DBA.WELL_CUMULATIVE_PRODUCTION as a left outer join DBA.WELL_FORMATION as b on(
    a.UWI = b.UWI and b.FORM_ID = a.ZONE_ID) group by b.UWI,a.UWI,a.ZONE_ID
    ORDER BY WellID
    , ZoneID
    , MD
    ;