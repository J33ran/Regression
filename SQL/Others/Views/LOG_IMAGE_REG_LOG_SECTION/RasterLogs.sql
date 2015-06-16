select LOG_IMAGE_REG_LOG_SECTION.WELL_ID as "Well ID",
    LOG_IMAGE_REG_LOG_SECTION.LOG_SECTION_NAME as "Section Name",
    LOG_IMAGE_REG_LOG_SECTION.TIF_FILENAME as "File Name",
    LOG_IMAGE_REG_LOG_SECTION.TOP_DEPTH as "Top Depth",
    LOG_IMAGE_REG_LOG_SECTION.BASE_DEPTH as "Base Depth"
    from DBA.LOG_IMAGE_REG_LOG_SECTION
    ORDER BY "Well ID"
    , "LOG_SECTION_INDEX"
    ;