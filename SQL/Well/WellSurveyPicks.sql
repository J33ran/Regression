-- ALTER VIEW "DBA"."WellSurveyPicks" as
select WELL.UWI as "Well ID", WELL.GX_DEV_WELL_BLOB, WELL.SURFACE_LONGITUDE as Lng,
WELL.SURFACE_LATITUDE as Lat, WELL.FINAL_TD as TD,
WELL.DEPTH_DATUM_ELEV as "Datum Elev", FormationsOrderedBySource.Formation,
FormationsOrderedBySource."Top MD", FormationsOrderedBySource."Top TVD",
FormationsOrderedBySource."Source Order",
FormationsOrderedBySource."Observation Number"
from FormationsOrderedBySource, WELL
where FormationsOrderedBySource."Well ID" = WELL.UWI
ORDER BY "Well ID";
--end
