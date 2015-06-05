select c.COLUMN_NAME as "Column Name",c.FORM_ID as ID,c.SOURCE as Source,
    DBA.GET_ALIAS_LIST(c.FORM_ID) as Alias,c.FORM_AGE as Age,
    c.FORM_NAME as Name,c.GROUP_CODE as "Group ID",
    c.GX_DOMINANT_LITHOLOGY as Lithology,
    c.GX_VENDOR_NO as "Age Code",c.GX_INTERNAL as "Internal ID",
    c.GX_FORMATION_TYPE as Type,
    c.FORM_ABRV as Abbreviation,c.GX_WEIGHT as "Line Weight",
    c.GX_COLOR as "Line Color",c.GX_STYLE as "Line Style",
    c.GX_STRAT_SEQUENCE as "Sequence No",c.GX_ACTIVE as Active,
    a."Well ID" as "Well ID"
    from dba.FORMATION as c,dba.WellHeader as a,dba.AliasedPicks as b
    where a."Well ID" = b."Well ID"
    and c.FORM_ID = b."Alias ID"
    and c.FORM_ID = b.ID and
    not c.FORM_ID = any(select FM_ALIAS_GROUP_MEMBER.MEMBER_FM_ID from DBA.FM_ALIAS_GROUP_MEMBER where FM_ALIAS_GROUP_MEMBER.FORM_ID <> FM_ALIAS_GROUP_MEMBER.MEMBER_FM_ID and FM_ALIAS_GROUP_MEMBER.ALIAS_CODE <> 2) 
    ORDER BY "ID", "Column Name", "Well ID";