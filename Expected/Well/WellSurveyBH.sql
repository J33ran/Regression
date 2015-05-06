select WELL.UWI as "Well ID",WELL.PRIMARY_SOURCE as Source,
well.gx_bottom_hole_y_offset as "BH N/S Offset",
well.gx_bottom_hole_ns_direction as "BH N/S Direction",
well.gx_bottom_hole_x_offset as "BH E/W Offset",
well.gx_bottom_hole_ew_direction as "BH E/W Direction",
well.bottom_hole_latitude as "BH Lat/X",
well.bottom_hole_longitude as "BH Long/Y",well.gx_bottom_hole_tvd as "BH TVD"
from dba.WELL ORDER BY "Well ID";OUTPUT TO D:\Samples\GXDBRegression\GXDBRegression\Results\Well\WellSurveyBH.sql_1.xml FORMAT XML