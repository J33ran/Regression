select WELL_FORMATION.UWI as "Well ID",WELL_FORMATION.SOURCE as Source,
    WELL_FORMATION.FORM_ID as Formation,
    WELL_FORMATION.FORM_OBS_NO as "Observation Number",
    WELL_FORMATION.GX_FORM_ID_ALIAS as "Form Alias",
    WELL_FORMATION.GX_FORM_TOP_DEPTH as "Top MD",
    WELL_FORMATION.GX_FORM_TOP_TVD as "Top TVD",
    WELL_FORMATION.GX_FORM_BASE_DEPTH as "Base MD",
    WELL_FORMATION.GX_FORM_BASE_TVD as "Base TVD",
    WELL_FORMATION.GX_FORM_X_COORDINATE as "X Coordinate",
    WELL_FORMATION.GX_FORM_Y_COORDINATE as "Y Coordinate",
    DBA.SUBSEAS(WELL_FORMATION.GX_FORM_TOP_TVD,WELL_FORMATION.GX_FORM_DEPTH_DATUM) as "Top Subsea",
    DBA.SUBSEAS(WELL_FORMATION.GX_FORM_BASE_TVD,WELL_FORMATION.GX_FORM_DEPTH_DATUM) as "Base Subsea",
    WELL_FORMATION.PICK_QUALIFIER as Qualifier,
    DBA.GROSS_THICKNESS(WELL_FORMATION.GX_FORM_BASE_DEPTH,WELL_FORMATION.GX_FORM_TOP_DEPTH) as "Gross Thickness",
    WELL_FORMATION.GX_NET_THICKNESS as "Net Thickness",
    WELL_FORMATION.GX_POROSITY as Porosity,WELL_FORMATION.FAULTED_IND as Faulted,
    WELL_FORMATION.GX_ERODED_IND as Eroded,
    WELL_FORMATION.GX_DIP_AZIMUTH as "Dip Azimuth",WELL_FORMATION.GX_DIP as Dip,
    DBA.TVTS(WELL_FORMATION.GX_FORM_TOP_DEPTH,WELL_FORMATION.GX_FORM_BASE_DEPTH,WELL_FORMATION.GX_FORM_TOP_TVD,WELL_FORMATION.GX_FORM_BASE_TVD,WELL_FORMATION.GX_WELLBORE_AZIMUTH,WELL_FORMATION.GX_WELLBORE_ANGLE,WELL_FORMATION.GX_DIP_AZIMUTH,WELL_FORMATION.GX_DIP) as TVT,
    DBA.TSTS(TVT,WELL_FORMATION.GX_DIP) as TST,WELL_FORMATION.GX_SHOW as Show,
    WELL_FORMATION.PICK_QUALITY as Confidence,WELL_FORMATION.GX_USER3 as User3,
    WELL_FORMATION.GX_USER1 as User1,WELL_FORMATION.GX_USER2 as User2,
    WELL_FORMATION.GX_USER4 as User4,WELL_FORMATION.GX_USER5 as User5,
    WELL_FORMATION.GX_USER6 as User6,
    WELL_FORMATION.GX_WELLBORE_AZIMUTH as "Wellbore Azimuth",
    WELL_FORMATION.GX_WELLBORE_ANGLE as "Wellbore Angle",
    WELL_FORMATION.GX_INTERNAL_NO as "Internal Number",
    WELL_FORMATION.REMARK as Remarks,WELL_FORMATION.DOMINANT_LITHOLOGY as Lithology,
    WELL_FORMATION.GX_VENDOR_NO as "Age Code",
    WELL_FORMATION.GX_STRAT_COLUMN as "Strat Column",
    WELL_FORMATION.GAP_THICKNESS as "Gap Thickness",
    WELL_FORMATION.FAULT_NAME as "Fault Name",
    WELL_FORMATION.UNCONFORMITY_NAME as "Unconformity Name",
    WELL_FORMATION.PICK_TYPE as "Pick Type",
    WELL_FORMATION.PERCENT_THICKNESS as "Percent Thickness",
    WELL_FORMATION.UNC_FAULT_SOURCE as "Unc/Fault Source",
    WELL_FORMATION.UNC_FAULT_OBS_NO as "Unc/Fault Obs No",
    cast(null as varchar(20)) as "Group"
    from dba.WELL_FORMATION
    ORDER BY "Well ID"
    , Source
    , FORMATION
    , "Observation Number"
    ;