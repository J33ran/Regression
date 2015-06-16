select a.WELL_PAD_NAME as "Pad Name",
    a.PAD_ELEVATION as Elevation,
    a.LAT_CENTROID as "Pad Latitude",
    a.LNG_CENTROID as "Pad Longitude",
    a.NO_SLOTS as "Number of Slots",
    b.SLOT_ID as "Slot ID",
    b.SLOT_NO as "Slot Number",
    b.POD_ID as "Pod Number",
    b.UWI as "Well ID",
    b.WELL_NAME as "Well Name",
    b.WELL_NO as "Well Number",
    b.LATITUDE as "Slot Latitude",
    b.LONGITUDE as "Slot Longitude",
    0 as "Slot X Coordinate",
    0 as "Slot Y Coordinate",
    c.GX_PROPOSED_FLAG as "Proposed Flag"
    from DBA.WELL_PAD as a,DBA.WELL_PAD_SLOT as b,DBA.WELL as c
    where a.WELL_PAD_NAME = b.WELL_PAD_NAME and b.UWI = c.UWI
    ORDER BY "Pad Name"
    , "Well ID"
    ;