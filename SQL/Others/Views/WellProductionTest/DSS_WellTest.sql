select WellProductionTest."Well ID" as WellID,
    WellProductionTest."Test Date" as "Date",
    WellProductionTest."Well ID"+'_'+WellProductionTest."Top Formation" as PID,
    WellProductionTest."Well ID"+'_'+WellProductionTest."Top Formation" as NAME,
    WellProductionTest."P/Z" as PZ,
    WellProductionTest."Cum Gas" as CumGas,
    WellProductionTest."Oil Rate" as OilRate,
    WellProductionTest."Gas Rate" as GasRate,
    WellProductionTest."Water Rate" as WaterRate,
    WellProductionTest."Test Type" as TestType
    from DBA.WellProductionTest
    ORDER BY "Well ID"
    , TestType
    , "Run Number"
    , "Test Number"
    ;
