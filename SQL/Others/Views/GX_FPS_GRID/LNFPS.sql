select GX_FPS_GRID.POLYGONID as "POLYGON ID",GX_FPS_GRID.SECTION as SECTION,
    GX_FPS_GRID.GRID as GRID,
    GX_FPS_GRID.REFERENCE_LATITUDE as "REFERENCE LATITUDE",
    GX_FPS_GRID.REFERENCE_LONGITUDE as "REFERENCE LONGITUDE",
    GX_FPS_GRID.MINX as "MINIMUM X",GX_FPS_GRID.MINY as "MINIMUM Y",
    GX_FPS_GRID.MAXX as "MAXIMUM X",GX_FPS_GRID.MAXY as "MAXIMUM Y",
    GX_FPS_GRID.MAJORCODE as "MAJOR CODE",GX_FPS_GRID.MINORCODE as "MINOR CODE",
    GX_FPS_GRID.ISPARTIAL as "IS PARTIAL",GX_FPS_GRID.POLYGONBLOB as "POLYGON BLOB"
    from DBA.GX_FPS_GRID 
    ORDER BY "POLYGON ID";