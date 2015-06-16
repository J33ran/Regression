select SEIS_ACQTN_SURVEY.SEIS_ACQTN_SURVEY_ID as Program,
    SEIS_ACQTN_SURVEY.SOURCE as Source,
    SEIS_ACQTN_SURVEY.ACQTN_SURVEY_NAME as "Program Name",
    SEIS_ACQTN_SURVEY.DIMENSION as Dimension,SEIS_ACQTN_SURVEY.COUNTRY as Country,
    SEIS_ACQTN_SURVEY.PROVINCE_STATE as State,SEIS_ACQTN_SURVEY.AREA_ID as Area,
    SEIS_ACQTN_SURVEY.START_DATE as "Start Date",
    SEIS_ACQTN_SURVEY.COMPLETED_DATE as "Completion Date",
    SEIS_ACQTN_SURVEY.GX_CREW as Crew,SEIS_ACQTN_SURVEY.GX_SHOT_BY as Contractor,
    SEIS_ACQTN_SURVEY.GX_COUNTY as County,
    SEIS_ACQTN_SURVEY.GX_NO_LINES as "# Lines",SEIS_ACQTN_SURVEY.REMARK as Remarks
    from dba.SEIS_ACQTN_SURVEY
    ORDER BY "Program"
    ;