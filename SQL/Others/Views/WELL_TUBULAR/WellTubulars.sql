select WELL_TUBULAR.UWI as "Well ID",WELL_TUBULAR.GX_CASE_NAME as "Case Name",WELL_TUBULAR.SOURCE as Source,
    WELL_TUBULAR.TUBING_TYPE as Type,WELL_TUBULAR.TUBING_OBS_NO as "Obs No",
    WELL_TUBULAR.GX_INSTALL_DATE as "Install Date",WELL_TUBULAR.GX_REMOVAL_DATE as "Removal Date",
    WELL_TUBULAR.OUTSIDE_DIA_DESC as "Outer Diameter",WELL_TUBULAR.GX_INSIDE_DIA_DESC as "Inner Diameter",
    WELL_TUBULAR.BASE_DEPTH as "Base Depth",WELL_TUBULAR.HUNG_TOP_DEPTH as "Hung Top Depth",
    WELL_TUBULAR.GX_CEMENT_AMT as "Cement Amount",WELL_TUBULAR.STEEL_SPEC as Grade,WELL_TUBULAR.TUBING_DENSITY as Weight,
    WELL_TUBULAR.GX_PACKER_DEPTH as "Packer Set @ Depth"
    from DBA.WELL_TUBULAR
    ORDER BY "Well ID"
    , "Case Name"
    , "Source"
    , "Type"
    , "Obs No"
    ;