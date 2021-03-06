SELECT
"UWI",
"WellHeaderWell ID",
"WellHeaderWell Name",
"WellHeaderWell Number",
"WellHeaderDatum Type",
"WellHeaderTD",
"WellHeaderDatum Elev",
"WellHeaderLatitude",
"WellHeaderLongitude",
"WellHeaderOperator",
"WellHeaderClassification",
"WellHeaderStatus",
"WellHeaderLocation",
"WellHeaderLegal Description",
"WellSurveyDirBH TVD",
"WellSurveyDirBH N/S Offset",
"WellSurveyDirBH E/W Offset",
"WellSurveyDirKOP MD",
"WellSurveyDirMagnetic Declination",
"WellSurveyDirLatitude",
"WellSurveyDirLongitude",
"WellSurveyDirCalculation Method",
"SurveyStationsAzimuth",
"SurveyStationsE/W Offset",
"SurveyStationsLat/Y",
"SurveyStationsLong/X",
"SurveyStationsInclination",
"SurveyStationsTVD",
"SurveyStationsMD",
"SurveyStationsN/S Offset",
"SurveyStationsSurvey Point Number",
"LocationCongressWell ID",
"LocationCongressE/W Direction",
"LocationCongressN/S Direction",
"LocationCongressTownship",
"LocationCongressRange",
"LocationCongressSection",
"LocationCongressMeridian",
"LocationCongressLocation Description",
"LocationTexasAbstract",
"LocationTexasCounty",
"LocationTexasBlock",
"LocationTexasSection",
"LocationTexasTownship",
"LocationTexasN/S Dir",
"LocationTexasSurvey",
"LocationTexasLot",
"LocationTexasLocation Description",
"LocationOffshoreAgency",
"LocationOffshoreOCS Number",
"LocationOffshoreBlock",
"LocationOffshoreArea",
"LocationOffshoreLocation Description",
"LocationOffshoreWell ID",
"LocationDLSTownship",
"LocationDLSRange",
"LocationDLSSection",
"LocationDLSN/S Dir",
"LocationDLSE/W Dir",
"LocationDLSLocationDescription",
"LocationNERef. Latitude",
"LocationNERef. Longitude",
"WellHeaderInternal Status",
"WellSurveyDirFootage",
"WellHeaderWSN",
"WellHeaderProposed",
"WellProposedSurveyDirSurvey ID",
"WellProposedSurveyDirBH TVD",
"WellProposedSurveyDirBH N/S Offset",
"WellProposedSurveyDirBH E/W Offset",
"WellProposedSurveyDirKOP MD",
"WellProposedSurveyDirMagnetic Declination",
"WellProposedSurveyDirBH Latitude",
"WellProposedSurveyDirBH Longitude",
"WellProposedSurveyDirCalculation Method",
"WellProposedSurveyDirLP TVD",
"WellProposedSurveyDirLP N/S Offset",
"WellProposedSurveyDirLP E/W Offset",
"WellProposedSurveyDirFootage",
"WellProposedSurveyDirActive",
"ProposedSurveyStationsAzimuth",
"ProposedSurveyStationsE/W Offset",
"ProposedSurveyStationsLat/Y",
"ProposedSurveyStationsLong/X",
"ProposedSurveyStationsInclination",
"ProposedSurveyStationsTVD",
"ProposedSurveyStationsMD",
"ProposedSurveyStationsN/S Offset",
"ProposedSurveyStationsSurvey Point Number",
"WellPerforation",
"WellCompletionTest Type",
"WellCompletionComp Fm",
"WellCompletionDate",
"WellCompletionTop Depth",
"WellCompletionBase Depth",
"WellCompletionTop Fm",
"WellCompletionBottom Fm",
"WellProposedSurveyDirS/T/R",
"WellSurveyDirS/T/R",
"WellSurveyDirNorth Reference"
FROM "dba"."TMP_WELL_PROTECTED_FIELDS"
ORDER BY "UWI";