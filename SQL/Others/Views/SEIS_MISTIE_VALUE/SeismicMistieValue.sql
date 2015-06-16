select SEIS_MISTIE_VALUE.SEIS_ACQTN_SURVEY_ID as Program,
    SEIS_MISTIE_VALUE.SEIS_LINE_ID as "Line ID",
    SEIS_MISTIE_VALUE.SEIS_PICK_ID as Event,
    SEIS_MISTIE_VALUE.SEIS_SHIFT_TYPE as "Shift Type",
    SEIS_MISTIE_VALUE.SEIS_SHIFT_VALUE as "Shift Value"
    from dba.SEIS_MISTIE_VALUE where SEIS_MISTIE_VALUE.SEIS_SHIFT_TYPE in( 'Time','Depth')
    ORDER BY "Program"
    , "Line ID"
    , "Event" 
    , "Shift Type"
    ;