select a.UWI as "Well ID",
    a.TUBING_SET_DEPTH as "Tubing Set Depth",
    a.TUBING_STRING_NO as "Tubing String Number",
    a.DATA_SOURCE as "Data Source",
    a.TOP_FORMATION as "Top Formation",
    a.TUBING_INSTALL_DTE as "Tubing Install Date",
    a.TUBING_REMOVE_DTE as "Tubing Remove Date",
    a.TUBING_SIZE as "Tubing Size",
    a.CREATE_DATE as "Create Date",
    a.CREATE_USER_ID as "Create User ID",
    a.UPDATE_USER_ID as "Update User ID",
    a.UPDATE_DATE as "Update Date",
    a.REMARK as Remark,
    a.TUBING_SET_DEPTH_OUOM as "Tubing Set Depth OUOM",
    a.TUBING_SIZE_OUOM as "Tubing Size OUOM"
    from DBA.TUBING as a
    ORDER BY "Well ID"
    , "Tubing Set Depth"
    , "Tubing String Number"
    ;