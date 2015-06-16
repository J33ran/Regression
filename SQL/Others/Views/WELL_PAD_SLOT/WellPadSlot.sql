select WELL_PAD_SLOT.WELL_PAD_NAME as "Pad Name",
    WELL_PAD_SLOT.SLOT_ID as "Slot ID",
    WELL_PAD_SLOT.UWI as "Well ID",
    WELL_PAD_SLOT.SLOT_NO as "Slot Number",
    WELL_PAD_SLOT.POD_ID as "Pod Number",
    WELL_PAD_SLOT.WELL_NAME as "Well Name",
    WELL_PAD_SLOT.WELL_NO as "Well Number",
    WELL_PAD_SLOT.LATITUDE as Latitude,
    WELL_PAD_SLOT.LONGITUDE as Longitude,
    WELL_PAD_SLOT.X_COORDINATE as "X Coordinate",
    WELL_PAD_SLOT.Y_COORDINATE as "Y Coordinate",
    WELL_PAD_SLOT.STEP_OUT as "Step Out",
    WELL_PAD_SLOT.KICK_OFF as "Kick Off",
    WELL_PAD_SLOT.PAD_CONFIGURATION as "Pad Configuration",
    WELL_PAD_SLOT.TARGET_DEPTH as "Target Depth",
    WELL_PAD_SLOT.TOE_HEIGHT as "Toe Height",
    WELL_PAD_SLOT.HORIZONTAL_SPACING as "Well Spacing",
    WELL_PAD_SLOT.VERTICAL_SPACING as "Vertical Spacing",
    WELL_PAD_SLOT.HEEL_X_COORDINATE as "Target X Coord",
    WELL_PAD_SLOT.HEEL_Y_COORDINATE as "Target Y Coord",
    WELL_PAD_SLOT.HEEL_LATITUDE as "Target Latitude",
    WELL_PAD_SLOT.HEEL_LONGITUDE as "Target Longitude",
    WELL_PAD_SLOT.REMARKS as Remarks
    from DBA.WELL_PAD_SLOT
    ORDER BY "Pad Name"
    , "UWI"
    ;