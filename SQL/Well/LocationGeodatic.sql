--ALTER VIEW "DBA"."LocationGeodetic" as
SELECT UWI as "Well ID", SURFACE_LATITUDE as "Lat/X", SURFACE_LONGITUDE as "Long/Y"
from WELL ORDER BY "Well ID";
