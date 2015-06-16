select well_node_version.NODE_ID as "Well ID",WELL_NODE_VERSION.NODE_OBS_NO,
    well_node_version.dy as "KOP N/S Offset",
    well_node_version.NS_direction as "KOP N/S Direction",
    well_node_version.dx as "KOP E/W Offset",
    well_node_version.EW_direction as "KOP E/W Direction",
    well_node_version.latitude as "KOP Lat/X",
    well_node_version.longitude as "KOP Long/Y",well_node_version.md as "KOP MD",
    well_node_version.tvd_depth as "KOP TVD"
    from dba.WELL_NODE_VERSION
    ORDER BY "Well ID"
    ;