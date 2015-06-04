select a.UWI as "Well ID",a.SOURCE as Source,a.FORM_ID as Formation,
    a.FORM_OBS_NO as "Observation Number",a.GX_FORM_ID_ALIAS as "Form Alias",
    a.GX_FORM_TOP_DEPTH as "Top MD",a.GX_FORM_TOP_TVD as "Top TVD",
    a.GX_FORM_BASE_DEPTH as "Base MD",a.GX_FORM_BASE_TVD as "Base TVD",
    DBA.SUBSEAS(a.GX_FORM_TOP_TVD,a.GX_FORM_DEPTH_DATUM) as "Top Subsea",
    DBA.SUBSEAS(a.GX_FORM_BASE_TVD,a.GX_FORM_DEPTH_DATUM) as "Base Subsea",
    a.PICK_QUALIFIER as Qualifier,
    DBA.GROSS_THICKNESS(a.GX_FORM_BASE_DEPTH,a.GX_FORM_TOP_DEPTH) as "Gross Thickness",
    a.GX_NET_THICKNESS as "Net Thickness",a.GX_POROSITY as Porosity,
    a.FAULTED_IND as Faulted,a.GX_ERODED_IND as Eroded,
    a.GX_DIP_AZIMUTH as "Dip Azimuth",a.GX_DIP as Dip,
    DBA.TVTS(a.GX_FORM_TOP_DEPTH,a.GX_FORM_BASE_DEPTH,a.GX_FORM_TOP_TVD,a.GX_FORM_BASE_TVD,a.GX_WELLBORE_AZIMUTH,a.GX_WELLBORE_ANGLE,a.GX_DIP_AZIMUTH,a.GX_DIP) as TVT,
    DBA.TSTS(TVT,a.GX_DIP) as TST,a.GX_SHOW as Show,a.PICK_QUALITY as Confidence,
    a.GX_USER3 as User3,a.GX_USER1 as User1,a.GX_USER2 as User2,
    a.GX_USER4 as User4,a.GX_USER5 as User5,a.GX_USER6 as User6,
    a.GX_WELLBORE_AZIMUTH as "Wellbore Azimuth",
    a.GX_WELLBORE_ANGLE as "Wellbore Angle",b.GX_INTERNAL_ID as "Source Order",
    a.REMARK as Remarks,a.DOMINANT_LITHOLOGY as Lithology,
    a.ROW_CHANGED_DATE as "Row Changed Date",
    a.GX_VENDOR_NO as "Age Code"
    from dba.WELL_FORMATION as a,dba.R_SOURCE as b
    where a.SOURCE = b.SOURCE
    ORDER BY "Well ID", Source, Formation;
