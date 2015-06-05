select FAULT.FAULT_ID as ID,
    FAULT.SOURCE as Source,
    FAULT.GX_FAULT_ID_ALIAS as Alias,
    FAULT.FAULT_NAME as Name,
    FAULT.FAULT_TYPE as Type,
    FAULT.REMARK as Remarks
    from dba.FAULT 
    ORDER BY "ID";