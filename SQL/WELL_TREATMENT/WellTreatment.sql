select WELL_TREATMENT.UWI as "Well ID",
    WELL_TREATMENT.SOURCE as Source,
    WELL_TREATMENT.TEST_NUMBER as "Test Number",
    WELL_TREATMENT.TREATMENT_OBS_NO as "Treatment ID",
    WELL_TREATMENT.TREATMENT_TYPE as "Treatment Type",
    WELL_TREATMENT.RUN_NUMBER as "Run Number",
    WELL_TREATMENT.TEST_TYPE as "Test Type",
    WELL_TREATMENT.STAGE_NO as Stage,
    WELL_TREATMENT.TOP_FORM as Formation,
    WELL_TREATMENT.TREATMENT_DATE as "Date",
    WELL_TREATMENT.TOP_DEPTH as "Top Depth",
    WELL_TREATMENT.BASE_DEPTH as "Base Depth",
    WELL_TREATMENT.ADDITIVE_TYPE as Additive,
    WELL_TREATMENT.INJECTION_RATE as "Injection Rate",
    WELL_TREATMENT.TREATMENT_FLUID_TYPE as "Fluid Type",
    WELL_TREATMENT.TREATMENT_AMT as "Treatment Amount",
    WELL_TREATMENT.TREATMENT_AMT_UOM as "Treatment Amount UOM",
    WELL_TREATMENT.TREATMENT_PRESS as "Treatment Pressure",
    WELL_TREATMENT.FORM_BREAK_PRESS as "Formation Breakage Pressure",
    WELL_TREATMENT.PROPPANT_AGENT_TYPE as "Proppant Type",
    WELL_TREATMENT.PROPPANT_AGENT_AMT as "Proppant Amount",
    WELL_TREATMENT.PROPPANT_AMT_UOM as "Proppant Amount UOM",
    WELL_TREATMENT.GX_FRAC_HEIGHT_DES as "Fracture Height",
    WELL_TREATMENT.GX_FRAC_WIDTH_DES as "Fracture Width",
    WELL_TREATMENT.GX_FRAC_LENGTH_DES as "Fracture Length",
    WELL_TREATMENT.REMARK as Remarks
    from DBA.WELL_TREATMENT
    ORDER BY "Well ID"
    , "Source"
    , "Test Number"
    , "Treatment ID"
    , "Run Number"
    , "Test Type"
    ;
