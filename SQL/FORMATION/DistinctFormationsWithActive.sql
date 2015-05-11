select FORMATION.SOURCE as Source,FORMATION.FORM_ID as Formation,
    FORMATION.GX_INTERNAL as "Internal Number",FORMATION.GX_ACTIVE as Active
    from DBA.FORMATION 
    ORDER BY Formation, "Internal Number";
