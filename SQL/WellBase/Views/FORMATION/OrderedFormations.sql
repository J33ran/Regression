select a.UWI as "Well ID",a.SOURCE as Source,a.FORM_ID as Formation,
    a.FORM_OBS_NO as "Observation Number",
    c."Alias ID" as "Form Alias",
    a.GX_FORM_TOP_DEPTH as "Top MD",a.GX_FORM_TOP_TVD as "Top TVD",
    a.GX_FORM_BASE_DEPTH as "Base MD",a.GX_FORM_BASE_TVD as "Base TVD",
    DBA.SUBSEAS(a.GX_FORM_TOP_TVD,a.GX_FORM_DEPTH_DATUM) as "Top Subsea",
    DBA.SUBSEAS(a.GX_FORM_BASE_TVD,a.GX_FORM_DEPTH_DATUM) as "Base Subsea",
    a.GX_FORM_X_COORDINATE as "X Coordinate",
    a.GX_FORM_Y_COORDINATE as "Y Coordinate",
    a.PICK_QUALIFIER as Qualifier,
    DBA.GROSS_THICKNESS(a.GX_FORM_BASE_DEPTH,a.GX_FORM_TOP_DEPTH) as "Gross Thickness",
    a.GX_NET_THICKNESS as "Net Thickness",a.GX_POROSITY as Porosity,
    a.FAULTED_IND as Faulted,a.GX_ERODED_IND as Eroded,
    a.GX_DIP_AZIMUTH as "Dip Azimuth",a.GX_DIP as Dip,
    DBA.TVTS(a.GX_FORM_TOP_DEPTH,a.GX_FORM_BASE_DEPTH,a.GX_FORM_TOP_TVD,a.GX_FORM_BASE_TVD,a.GX_WELLBORE_AZIMUTH,a.GX_WELLBORE_ANGLE,a.GX_DIP_AZIMUTH,a.GX_DIP) as TVT,
    DBA.TSTS(TVT,a.GX_DIP) as TST,a.GX_SHOW as Show,a.PICK_QUALITY as Confidence,
    a.GX_USER3 as User3,a.GX_USER1 as User1,a.GX_USER2 as User2,
    a.GX_WELLBORE_AZIMUTH as "Wellbore Azimuth",
    a.GX_WELLBORE_ANGLE as "Wellbore Angle",b.GX_INTERNAL as "Internal Number",
    a.REMARK as Remarks,b.GX_DOMINANT_LITHOLOGY as Lithology,
    b.GX_VENDOR_NO as "Age Code",b.GX_DOMINANT_LITHOLOGY as "Strat Column",b.COLUMN_NAME as "Column Name",
    a.GAP_THICKNESS as "Gap Thickness",
    a.FAULT_NAME as "Fault Name",
    a.UNCONFORMITY_NAME as "Unconformity Name",
    a.PICK_TYPE as "Pick Type",
    a.PERCENT_THICKNESS as "Percent Thickness",
    a.UNC_FAULT_SOURCE as "Unc/Fault Source",
    a.UNC_FAULT_OBS_NO as "Unc/Fault Obs No",
    null as Active,
    null as "List Name",
    b.GROUP_CODE as "Group"
    from dba.WELL_FORMATION as a,dba.FORMATION as b,dba.AliasedPicks as c
    where b.FORM_ID = c."Alias ID"
    and a.UWI = c."Well ID"
    and a.FORM_ID = c.ID
    and a.SOURCE = c.Source
    and a.FORM_OBS_NO = c."Obs No"
    and c."Priority #"
     = (select min(d."Priority #")
      from dba.AliasedPicks as d
      where d."Well ID" = c."Well ID" and d."Alias ID" = c."Alias ID" and d."Obs No" = c."Obs No" and d.Source = c.Source)
    ORDER BY "Well ID", Formation, Source;
