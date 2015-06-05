select AllocatedMonthlyProduction."Well ID" as WellID,
    AllocatedMonthlyProduction."Date" as "Date",
    AllocatedMonthlyProduction."Well ID"+'_'+AllocatedMonthlyProduction."Zone Alias" as PID,
    AllocatedMonthlyProduction."Well ID"+'_'+AllocatedMonthlyProduction."Zone Alias" as NAME,
    AllocatedMonthlyProduction.Product as Product,
    AllocatedMonthlyProduction.Oil as Oil,
    AllocatedMonthlyProduction.Gas as Gas,
    AllocatedMonthlyProduction.Water as Water,
    AllocatedMonthlyProduction."Days On" as Days_On,
    AllocatedMonthlyProduction.Yield as Yield,
    AllocatedMonthlyProduction.CO2 as CO2,
    AllocatedMonthlyProduction.Injection as Injection,
    AllocatedMonthlyProduction.NGL as NGL,
    AllocatedMonthlyProduction.Nitrogen as Nitrogen,
    AllocatedMonthlyProduction.Sulphur as Sulphur,
    AllocatedMonthlyProduction."Total Fluids" as Total_Fluids,
    AllocatedMonthlyProduction."Percent Allocation" as Percent_Allocation,'COMP' as PType,
    AllocatedMonthlyProduction.Source as Source,
    AllocatedMonthlyProduction.Zone as Zone,
    AllocatedMonthlyProduction."Activity Type" as Activity_Type
    from DBA.AllocatedMonthlyProduction
    ORDER BY WellID
    , "Date"
    ;