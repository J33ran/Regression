select z."Well ID",
    z."Well Name",
    z."Well Number",
    a.ZONE_NAME as "Zone Name",
    c.ZATTRIBUTE_NAME as "Attribute Name",
    c.ZATTRIBUTE_VALUE_NUMERIC as "Numeric Attribute Value",
    c.ZATTRIBUTE_VALUE_STRING as "Character Attribute Value",
    c.ZATTRIBUTE_VALUE_DATE as "Date Attribute Value",
    b.TVDSS
    from(DBA.GX_ZONE as a,DBA.WellHeader as z)
      left outer join DBA.WELL_ZONE_INTERVAL as b on b.ZONE_NAME = a.ZONE_NAME and b.UWI = z."Well ID"
      left outer join DBA.WELL_ZONE_INTRVL_VALUE as c on c.UWI = z."Well ID" and c.ZONE_NAME = a.ZONE_NAME
    ORDER BY "Well ID", "Zone Name";
