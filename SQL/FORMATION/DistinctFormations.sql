    select distinct FORMATION.SOURCE as Source,FORMATION.FORM_ID as Formation,
    FORMATION.GX_INTERNAL as "Internal Number"
    from DBA.FORMATION 
    ORDER BY Formation, "Internal Number";
