select a.UWI as "Well ID",
    a.EQUIPMENT as Equipment,
    a.DEPTH_SET as "Depth Set",
    a.INSTALL_DATE as "Install Date",
    a.DATA_SOURCE as "Data Source",
    a.TUBING_STRING_NO as "Tubing String Number",
    a.LENGTH as Length,
    a.RETRIEVABILITY as Retrievability,
    a.MANUFACTURER as Manufacturer,
    a.MODEL_NO as "Model Number",
    a.EQUIPMENT_TYPE as "Equipment Type",
    a.EQUIPMENT_SIZE as "Equipment Size",
    a.OUTSIDE_DIAMETER as "Outside Diameter",
    a.INSIDE_DIAMETER_NOMINAL as "Inside Diameter Nominal",
    a.INSIDE_DIAMETER_DRIFT as "Inside Diameter Drift",
    a.REMOVAL_DATE as "Removal Date",
    a.EXTRA_NAME_1 as "Extra Name 1",
    a.EXTRA_VALUE_1 as "Extra Value 1",
    a.EXTRA_NAME_2 as "Extra Name 2",
    a.EXTRA_VALUE_2 as "Extra Value 2",
    a.EXTRA_NAME_3 as "Extra Name 3",
    a.EXTRA_VALUE_3 as "Extra Value 3",
    a.EXTRA_NAME_4 as "Extra Name 4",
    a.EXTRA_VALUE_4 as "Extra Value 4",
    a.CREATE_DATE as "Create Date",
    a.CREATE_USER_ID as "Create User ID",
    a.UPDATE_DATE as "Update Date",
    a.UPDATE_USER_ID as "Update User ID",
    a.COMMENTS as Comments,
    a.DEPTH_SET_OUOM as "Depth Set OUOM",
    a.LENGTH_OUOM as "Length OUOM",
    a.EQUIPMENT_SIZE_OUOM as "Equipment Size OUOM",
    a.OUTSIDE_DIAMETER_OUOM as "Outside Diameter OUOM",
    a.INSIDE_DIAMETER_NOMINAL_OUOM as "Inside Diameter Nominal OUOM",
    a.INSIDE_DIAMETER_DRIFT_OUOM as "Inside Diameter Drift OUOM"
    from DBA.TUBING_EQUIPMENT as a
    ORDER BY "Well ID"
    , "Equipment"
    , "Depth Set"
    , "Install Date"
    ;