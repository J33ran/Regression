select S.INTERP_ID as InterpID,
    S.DATA_SOURCE as Source,
    S.FAULT_ID as Fault,
    S.OVERTURNED_IND as OverturnedInd,
    S.Y as Y,
    S.X as X,
    S.PICK_DATE as PickDate,
    S.PICK_QUAL as PickQualifier,
    S.PICK_CONF_FACT as PickConfFact,
    S.REMARK as Remark,
    S.PICK_SOURCE as PickSource,
    S.PICK_SSTVD_METHOD as PickSSTVDMethod,
    S.PICK_SSTVD as PickSSTVD,
    S.VERTICAL_SEP_TVT as VerticalSepTVT
    from DBA.GX_FAULT_FIELD_PT as S
    ORDER BY InterpID;