SELECT a.UWI as "Well ID",
a.PROVINCE_STATE as "State",
a.COUNTY as "County",
a.OPERATOR as "Operator",
a.GX_LOCATION_STRING as "Location",
a.WELL_NAME as "Well Name",
a.WELL_NUMBER as "Well Number",
if b.GX_BASE_LONGITUDE is not null and b.GX_BASE_LATITUDE is not null then
b.GX_BASE_LATITUDE
else a.SURFACE_LATITUDE
endif as Latitude,
if b.GX_BASE_LATITUDE is not null and b.GX_BASE_LONGITUDE is not null then
b.GX_BASE_LONGITUDE
else a.SURFACE_LONGITUDE
endif as Longitude,
(case when 0 < any (select count(*) from DBA.WELL as b WHERE a.UWI = b.UWI and RIGHT(a.UWI,4) = '0000' and RIGHT(b.UWI,4) = '0000') then 1 else null end) as "Wells",
(case when 0 < any (select count(*) from DBA.WELL as b WHERE LEFT(a.UWI,12) = LEFT(b.UWI,12) and a.UWI <> b.UWI and SUBSTRING(a.UWI,14,1) LIKE '[1-9]') then 1 else null end) as "Wells with recompletions",
(case when 0 < any (select count(*) from DBA.WELL as b WHERE LEFT(a.UWI,10) = LEFT(b.UWI,10) AND a.UWI <> b.UWI and SUBSTRING(a.UWI,12,1) LIKE '[1-9]') then 1 else null end) as "Wells with sidetracks"
from
DBA.WELL as a join DBA.WELL_DIR_SRVY as b on a.UWI = b.UWI WHERE LENGTH(a.UWI) = 14
ORDER BY "Well ID";OUTPUT TO D:\Samples\GXDBRegression\GXDBRegression\Results\Well\Workovers.sql_1.xml FORMAT XML