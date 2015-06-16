select a.UWI as "Well ID",
    a.SOURCE as Source,
    a.ACTIVITY_TYPE as "Activity Type",
    case when c.MEMBER_FM_ID is null then a.ZONE_ID else c.FORM_ID
    end as "Zone Alias",a.VOLUME_METHOD as "Summary Type",
    a.OIL_EUR as "Oil EUR",
    a.OIL_RESERVES as "Oil Reserves",
    a.GAS_EUR as "Gas EUR",
    a.GAS_RESERVES as "Gas Reserves",
    avg(case when b.UWI = a.UWI and b.FORM_ID = a.ZONE_ID then b.GX_FORM_TOP_DEPTH else null
    end) as "Top Depth"
    from dba.WELL_CALCULATED_VOLUMES as a join dba.WELL_FORMATION as b
    on a.UWI = b.UWI left outer join DBA.FM_ALIAS_GROUP_MEMBER as c on a.ZONE_ID = c.MEMBER_FM_ID
    group by "Well ID",Source,"Activity Type","Zone Alias","Summary Type","Oil EUR","Oil Reserves","Gas EUR","Gas Reserves"
    ORDER BY "Well ID"
    , Source
    , "Activity Type"
    , a.VOLUME_METHOD
    , "Zone Alias"
    ;