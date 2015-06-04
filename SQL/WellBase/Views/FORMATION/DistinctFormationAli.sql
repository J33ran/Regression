es
  as select distinct FORMATION.SOURCE as Source,
    FORMATION.GX_FORM_ID_ALIAS as "Formation Alias",
    FORMATION.GX_INTERNAL as "Internal Number"
    from DBA.FORMATION with check option