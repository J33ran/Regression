select a.UWI as "Well ID",
    a.PDEN_TYPE as "PDEN Type",
    a.PDEN_SOURCE as Source,
    a.VOLUME_METHOD as "Summary Type",
    a.ZONE_ID as Zone,
    case when b.MEMBER_FM_ID is null or b.ALIAS_CODE not in( 0,2) then a.ZONE_ID else b.FORM_ID
    end as "Zone Alias",a.PDEN_DATE as "Date",
    a.PROD_TIME as "Days On",
    a.ACTIVITY_TYPE as "Activity Type",
    a.PRIMARY_PRODUCT as Product,
    a.OIL_VOLUME as Oil,
    a.GAS_VOLUME as Gas,
    a.WATER_VOLUME as Water,
    a.CO2_VOLUME as CO2,
    a.INJECTION_VOLUME as Injection,
    a.NGL_VOLUME as NGL,
    a.NITROGEN_VOLUME as Nitrogen,
    a.SULPHUR_VOLUME as Sulphur,
    a.VOLUME_YEAR as Year,
    a.VOLUME_MONTH as Month,
    a.GX_PERCENT_ALLOCATION as "Percent Allocation"
    from dba.GX_PDEN_VOL_SUM_BY_MONTH as a left outer join DBA.FM_ALIAS_GROUP_MEMBER as b on a.ZONE_ID = b.MEMBER_FM_ID
    where a.PDEN_TYPE = 'WELL'
    and a.VOLUME_METHOD = 'Monthly' 
    ORDER BY "Well ID"
    , "PDEN TYPE"
    , "Source"
    , "Summary Type"
    , "Zone"
    , "Date"
    , "Activity Type"
    ;
