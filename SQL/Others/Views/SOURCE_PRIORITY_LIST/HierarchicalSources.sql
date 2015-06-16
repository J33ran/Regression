select 0 as "List ID",
    a.LIST_NAME as "List Name",
    a.LIST_OWNER as "List Owner",
    b.SOURCE as Source,
    b.ID as ID,
    b.ACTIVE as Active
    from DBA.SOURCE_PRIORITY_LIST as a left outer join DBA.SOURCE_PRIORITY_LIST_MEMBER as b
    on a.LIST_NAME = b.LIST_NAME
    ORDER BY "List Name"
    , Source
    ;