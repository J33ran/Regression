select FORMATION.FORM_ID as Formation,R_SOURCE.SOURCE as Source
    from DBA.FORMATION,DBA.R_SOURCE 
    ORDER BY Formation, Source;