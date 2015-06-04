select WELL_FAULT.UWI as "Well ID",
    WELL_FAULT.SOURCE as Source,
    WELL_FAULT.FAULT_ID as Fault,
    WELL_FAULT.FAULT_OBS_NO as "Obs. No.",
    WELL_FAULT.GX_FAULT_ID_ALIAS as "Fault Alias",
    WELL_FAULT.TOP_DEPTH as "Top MD",
    WELL_FAULT.TOP_TVD as "Top TVD",
    DBA.SUBSEAS(WELL_FAULT.TOP_TVD,WELL_FAULT.GX_FAULT_DEPTH_DATUM) as Subsea,
    WELL_FAULT.GX_VERTICAL_SEP as "Vertical Sep",
    WELL_FAULT.GX_SLIP_TYPE as "Slip Type",
    WELL_FAULT.GX_DIP_ANGLE as "Dip Angle",
    WELL_FAULT.GX_DIP_AZIMUTH as "Dip Azimuth",
    WELL_FAULT.TOP_FORM as "Faulted Fm",
    WELL_FAULT.REMARK as Comments,
    WELL_FAULT.GX_SLIP_ID as Slip
    from DBA.WELL_FAULT
    ORDER BY "Well ID", Fault, "Obs. No.";