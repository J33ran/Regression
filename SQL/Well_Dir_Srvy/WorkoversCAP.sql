select a.UWI as "Well ID",
    a.PROVINCE_STATE as State,
    a.COUNTY as County,
    a.OPERATOR as Operator,
    a.GX_LOCATION_STRING as Location,
    a.WELL_NAME as "Well Name",
    a.WELL_NUMBER as "Well Number",
    if b.GX_BASE_LONGITUDE is not null and b.GX_BASE_LATITUDE is not null
    then b.GX_BASE_LATITUDE
    else a.SURFACE_LATITUDE
    endif as Latitude,
    if b.GX_BASE_LATITUDE is not null and b.GX_BASE_LONGITUDE is not null
    then b.GX_BASE_LONGITUDE
    else a.SURFACE_LONGITUDE
    endif as Longitude,
    (case when 0 < any(select count(*) from DBA.WELL as b where LENGTH(a.UWI) >= 16 and a.UWI = b.UWI and "RIGHT"(a.UWI,2) = '00' and "RIGHT"(b.UWI,2) = '00') then 1 else null
    end) as Wells,(case when 0 < any(select count(*) from DBA.WELL as b where LENGTH(a.UWI) >= 16 and SUBSTRING(a.UWI,-2,1) = '0' and SUBSTRING(a.UWI,-1,1) <> '0') then 1 else null
    end) as "Wells with recompletions",null as "Wells with sidetracks"
    from DBA.WELL as a join DBA.WELL_DIR_SRVY as b on a.UWI = b.UWI where LENGTH(a.UWI) >= 16
    ORDER BY "Well ID";
