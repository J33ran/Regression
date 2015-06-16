select WellCumulativeProduction2."Well ID" as WellID,
    WellCumulativeProduction2."Well ID"+'_'+WellCumulativeProduction2."Zone Alias" as PID,
    WellCumulativeProduction2."Well ID"+'_'+WellCumulativeProduction2."Zone Alias" as NAME,
    WellCumulativeProduction2."Cum Oil Volume" as CumOil,
    WellCumulativeProduction2."Cum Gas Volume" as CumGas,
    WellCumulativeProduction2."Cum Water Volume" as CumWater
    from DBA.WellCumulativeProduction2  
    ORDER BY WellID
    , PID
    , NAME
    ;

