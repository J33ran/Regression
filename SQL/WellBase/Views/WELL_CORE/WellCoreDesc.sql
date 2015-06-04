select WELL_CORE.UWI as "Well ID",WELL_CORE.SOURCE as Source,
    well_core.core_id as "Core Number",well_core.core_type as Type,
    well_core.top_depth as "Top Depth",well_core.base_depth as "Base Depth",
    well_core.primary_core_form as Formation,
    well_core.gx_primary_core_form_alias as "Fm Alias",
    well_core.recovered_amt as "Recovery Amount",
    well_core.recovery_date as "Recovery Date",
    well_core.gx_qualifying_field as "User 1"
    from dba.WELL_CORE 
    ORDER BY "Well ID"
    , Source
    , "Core Number"
    ;
