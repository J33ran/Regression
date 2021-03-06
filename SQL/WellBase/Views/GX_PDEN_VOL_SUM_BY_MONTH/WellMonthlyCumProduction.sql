select GX_PDEN_VOL_SUM_BY_MONTH.UWI as "Well ID",
    GX_PDEN_VOL_SUM_BY_MONTH.ACTIVITY_TYPE as "Activity Type",
    GX_PDEN_VOL_SUM_BY_MONTH.PDEN_TYPE as "PDEN Type",
    GX_PDEN_VOL_SUM_BY_MONTH.VOLUME_METHOD as "Summary Type",
    GX_PDEN_VOL_SUM_BY_MONTH.PDEN_DATE as "Date",
    GX_PDEN_VOL_SUM_BY_MONTH.VOLUME_YEAR as Year,
    GX_PDEN_VOL_SUM_BY_MONTH.VOLUME_MONTH as Month,
    GX_PDEN_VOL_SUM_BY_MONTH.PDEN_SOURCE as Source,
    GX_PDEN_VOL_SUM_BY_MONTH.ZONE_ID as Zone,
    GX_PDEN_VOL_SUM_BY_MONTH.PRIMARY_PRODUCT as Product,
    GX_PDEN_VOL_SUM_BY_MONTH.OIL_CUM_VOLUME as "Cum Oil",
    GX_PDEN_VOL_SUM_BY_MONTH.WATER_CUM_VOLUME as "Cum Water",
    GX_PDEN_VOL_SUM_BY_MONTH.GAS_CUM_VOLUME as "Cum Gas",
    GX_PDEN_VOL_SUM_BY_MONTH.CO2_CUM_VOLUME as "Cum CO2",
    GX_PDEN_VOL_SUM_BY_MONTH.NGL_CUM_VOLUME as "Cum NGL",
    GX_PDEN_VOL_SUM_BY_MONTH.NITROGEN_CUM_VOLUME as "Cum Nitrogen",
    GX_PDEN_VOL_SUM_BY_MONTH.SULPHUR_CUM_VOLUME as "Cum Sulphur",
    GX_PDEN_VOL_SUM_BY_MONTH.OIL_VOLUME/DBA.DOM(GX_PDEN_VOL_SUM_BY_MONTH.VOLUME_MONTH) as "Oil Rate",
    DBA.TOTFLUIDS(GX_PDEN_VOL_SUM_BY_MONTH.WATER_CUM_VOLUME,GX_PDEN_VOL_SUM_BY_MONTH.OIL_CUM_VOLUME) as "Total Fluids",
    DBA.GOR(GX_PDEN_VOL_SUM_BY_MONTH.GAS_CUM_VOLUME,GX_PDEN_VOL_SUM_BY_MONTH.OIL_CUM_VOLUME) as GOR,
    DBA.OCUT(GX_PDEN_VOL_SUM_BY_MONTH.OIL_CUM_VOLUME,GX_PDEN_VOL_SUM_BY_MONTH.WATER_CUM_VOLUME) as "Oil Cut",
    DBA.WOR(GX_PDEN_VOL_SUM_BY_MONTH.WATER_CUM_VOLUME,GX_PDEN_VOL_SUM_BY_MONTH.OIL_CUM_VOLUME) as WOR,
    DBA.GAS_YIELD(GX_PDEN_VOL_SUM_BY_MONTH.GAS_CUM_VOLUME,GX_PDEN_VOL_SUM_BY_MONTH.OIL_CUM_VOLUME) as Yield   
    from DBA.GX_PDEN_VOL_SUM_BY_MONTH
    where GX_PDEN_VOL_SUM_BY_MONTH.PDEN_TYPE = 'WELL'
    and GX_PDEN_VOL_SUM_BY_MONTH.VOLUME_METHOD = 'Cumulative' 
    ORDER BY "Well ID"
	, "PDEN TYPE"
	, "Source"
	, "Summary Type"
	, "Zone"
	, "Date"
	, "Activity Type"
    ;