SELECT a.UWI as "Well ID",
if b.GX_BASE_LONGITUDE is not null and b.GX_BASE_LATITUDE is not null then
b.GX_BASE_LATITUDE
else a.SURFACE_LATITUDE
endif as Latitude,
if b.GX_BASE_LATITUDE is not null and b.GX_BASE_LONGITUDE is not null then
b.GX_BASE_LONGITUDE
else a.SURFACE_LONGITUDE
endif as Longitude,
(case when a.UWI = (select b.UWI from DBA.WELL_FORMATION as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as Tops,
(case when a.UWI = (select b.UWI from DBA.WELL_TEST as b where a.UWI = b.UWI and b.TEST_TYPE = 'IP' group by b.UWI) then 1 else null end) as IPs,
(case when a.UWI = (select b.UWI from DBA.WELL_CUMULATIVE_PRODUCTION as b where a.UWI = b.UWI and b.ACTIVITY_TYPE = 'PRODUCTION' group by b.UWI) then 1 else null end) as Production,
(case when a.UWI = (select b.UWI from DBA.WELL_FAULT as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as Faults,
(case when a.UWI = (select b.UWI from DBA.WELL_DIR_SRVY_STATION as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as "Deviation Surveys",
(case when a.UWI = (select b.UWI from DBA.WELL_CORE as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as Cores,
(case when a.UWI = (select b.UWI from DBA.WELL_CHECKSHOT_SURVEY as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as "Velocity Surveys",
(case when a.UWI = (select b.UWI from DBA.WELL_TEST as b where a.UWI = b.UWI and b.TEST_TYPE = 'DST' group by b.UWI) then 1 else null end) as DSTs,
(case when a.UWI = (select b.UWI from DBA.WELL_PERFORATION as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as Perfs,
(case when a.UWI = (select b.UWI from DBA.WELL_COMPLETION as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as Completions,
(case when a.UWI = (select b.UWI from DBA.GX_PRODUCTION_TEST as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as "Production Tests",
(case when a.UWI = (select b.UWI from DBA.WELL_CALCULATED_VOLUMES as b where a.UWI = b.UWI and(b.OIL_EUR is not null) group by b.UWI) then 1 else null end) as "Oil EUR",
(case when a.UWI = (select b.UWI from DBA.WELL_CALCULATED_VOLUMES as b where a.UWI = b.UWI and(b.OIL_RESERVES is not null) group by b.UWI) then 1 else null end) as "Oil Reserves",
(case when a.UWI = (select b.UWI from DBA.WELL_CALCULATED_VOLUMES as b where a.UWI = b.UWI and(b.GAS_EUR is not null) group by b.UWI) then 1 else null end) as "Gas EUR",
(case when a.UWI = (select b.UWI from DBA.WELL_CALCULATED_VOLUMES as b where a.UWI = b.UWI and(b.GAS_RESERVES is not null) group by b.UWI) then 1 else null end) as "Gas Reserves",
(case when a.UWI = (select b.UWI from DBA.WELL_CUMULATIVE_PRODUCTION as b where a.UWI = b.UWI and b.CUMULATIVE_OIL_VOLUME > 0 and b.ACTIVITY_TYPE = 'PRODUCTION' group by b.UWI) then 1 else null end) as "Oil Production",
(case when a.UWI = (select b.UWI from DBA.WELL_CUMULATIVE_PRODUCTION as b where a.UWI = b.UWI and b.CUMULATIVE_GAS_VOLUME > 0 and b.ACTIVITY_TYPE = 'PRODUCTION' group by b.UWI) then 1 else null end) as "Gas Production",
(case when a.UWI = (select b.UWI from DBA.WELL_CUMULATIVE_PRODUCTION as b where a.UWI = b.UWI and b.CUMULATIVE_WATER_VOLUME > 0 and b.ACTIVITY_TYPE = 'PRODUCTION' group by b.UWI) then 1 else null end) as "Water Production",
(case when a.UWI = (select b.UWI from DBA.TMP_WELL_PROTECTED_FIELDS as b where a.UWI = b.UWI group by b.UWI) then 1 else null end) as "Protected Fields",
(case when a.UWI = (select b.WELLID from DBA.GX_WELL_CURVE as b where a.UWI = b.WELLID group by b.WELLID) then 1 else null end) as "Well Logs",
(case when a.UWI = (select b.UWI from DBA.WELL_ZONE_INTRVL_VALUE as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else null end) as "Zones",
(case when a.UWI = (select b.UWI from DBA.TUBING as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Tubings",
(case when a.UWI = (select b.UWI from DBA.CASING as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Casings",
(case when a.UWI = (select b.UWI from DBA.LINER as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Liners",
(case when a.UWI = (select b.UWI from DBA.PACKER as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Packers",
(case when a.UWI = (select b.UWI from DBA.PLUGGING as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Plugs",
(case when a.UWI = (select b.UWI from DBA.TUBING_EQUIPMENT as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Tubing Equipment",
(case when a.UWI = (select b.WELL_ID from DBA.LOG_IMAGE_REG_LOG_SECTION as b where a.UWI = b.WELL_ID group by b.WELL_ID) then 1 else null end) as "Well Raster Logs",
(case when a.UWI = (select b.UWI from DBA.GGX_MICROSEISMIC_MSEVENT as b WHERE a.UWI = b.UWI group by b.UWI UNION select c.UWI from DBA.GGX_MICROSEISMIC_PRESSURE as c WHERE a.UWI = c.UWI group by c.UWI) then 1 else 0 end) as "Microseismic",
(case when a.UWI = (select b.UWI from DBA.WELL_TREATMENT as b WHERE a.UWI = b.UWI group by b.UWI) then 1 else 0 end) as "Well Treatments",
(case when a.UWI = (select b.UWI from DBA.WELL_DIR_SRVY as b where a.UWI = b.UWI and b.GX_BASE_LATITUDE <> a.SURFACE_LATITUDE and b.GX_BASE_LONGITUDE <> a.SURFACE_LONGITUDE group by b.UWI) then 1 else null end) as "Survey Offsets"
from
DBA.WELL as a join DBA.WELL_DIR_SRVY as b on a.UWI = b.UWI ORDER BY "Well ID";OUTPUT TO D:\Samples\GXDBRegression\GXDBRegression\Results\Well\WellDataPresent.sql_1.xml FORMAT XML