select a.UWI as "Well ID",
    a.STAGE as Stage,
    a.TIME_SEC as "Time",
    a.SURFACE_PRESSURE as "Surface Pressure",
    a.SLURRY_FLOW_RATE as "Slurry Flow Rate",
    a.PROPPANT_CONC as "Proppant Concentration",
    a.CLEAN_FLOW_RATE as "Clean Flow Rate",
    a.SLURRY_DENSITY as "Slurry Density",
    a.CALC_BOTTOM_HOLE_PRESSURE as "Calculated BH Pressure",
    a.MEAS_BOTTOM_HOLE_PRESS as "Measured BH Pressure",
    a.SURFACE_PRESSURE_TBG as "Surface Tubing Pressure",
    a.DEAD_STRING_PRESSURE as "Dead String Pressure",
    a.NITROGEN_RATE as "Nitrogen Rate",
    a.CO2_FLOW_RATE as "CO2 Flow Rate",
    a.BOTTOM_HOLE_TEMPERATURE as "BH Temperature"
    from DBA.GGX_MICROSEISMIC_PRESSURE as a
    ORDER BY "Well ID"
    , "Stage"
    , "Time"
    ;