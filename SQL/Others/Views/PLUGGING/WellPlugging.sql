select a.UWI as "Well ID",
    a.PLUGGING_DEPTH as "Plugging Depth",
    a.DATA_SOURCE as "Data Source",
    a.TOP_FORMATION as "Top Formation",
    a.PLUGGING_DTE as "Plugging Date",
    a.PLUGGING_TYPE as "Plugging Type",
    a.CEMENT_TYPE_PLUGGING as "Cement Type Plugging",
    a.CEMENT_AMT_PLUGGING as "Cement Amount Plugging",
    a.CEMENT_WEIGHT as "Cement Weight",
    a.TEST_METHOD as "Test Method",
    a.CREATE_DATE as "Create Date",
    a.CREATE_USER_ID as "Create User ID",
    a.UPDATE_USER_ID as "Update User ID",
    a.UPDATE_DATE as "Update Date",
    a.REMARK as Remark,
    a.PLUGGING_DEPTH_OUOM as "Plugging Depth OUOM",
    a.CEMENT_AMT_PLUGGING_OUOM as "Cement Amount Plugging OUOM",
    a.CEMENT_WEIGHT_OUOM as "Cement Weight OUOM"
    from DBA.PLUGGING as a
    ORDER BY "Well ID"
    , "Plugging Depth"
    ;