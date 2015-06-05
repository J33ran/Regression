select S.INTERP_ID as InterpID,
    S.DATA_SOURCE as Source,
    S.INTERPRETATION_NAME as InterpName,
    S.PRIMARY_FAULT as "Primary Fault",
    S.PRIMARY_SURF as "Primary Surface",
    S.TRIMMED_SURF as "Trimmed Surface",
    S.UP_DOWN_THROW_DIR as UpDown,
    S.X as X,
    S.Y as Y,
    S.Z as Z,
    S.VECTOR_X as VectorX,
    S.VECTOR_Y as VectorY,
    S.VECTOR_Z as VectorZ
    from DBA.GGX_SURF_GUIDING_PTS as S
    ORDER BY InterpID;