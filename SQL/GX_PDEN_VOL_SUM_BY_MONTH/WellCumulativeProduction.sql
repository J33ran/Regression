select P2.GX_PERCENT_ALLOCATION as Allocation,P2.ACTIVITY_TYPE as Activity,P2.ZONE_ID as Zone,P2.UWI as "Well ID",P2.PDEN_DATE as "Date",
    (select sum(P1.OIL_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative Oil",
    (select sum(P1.GAS_VOLUME)*P2.GX_PERCENT_ALLOCATION/100 from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative Gas",
    (select sum(P1.WATER_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative Water",
    (select sum(P1.INJECTION_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative Injection",
    (select sum(P1.CO2_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative CO2",
    (select sum(P1.NGL_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative NGL",
    (select sum(P1.SULPHUR_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative Sulphur",
    (select sum(P1.NITROGEN_VOLUME)*P2.GX_PERCENT_ALLOCATION/100
      from dba.GX_PDEN_VOL_SUM_BY_MONTH as P1
      where P1.PDEN_DATE <= P2.PDEN_DATE and P1.UWI = P2.UWI) as "Cumulative Nitrogen"
    from dba.GX_PDEN_VOL_SUM_BY_MONTH as P2
    group by Allocation,Activity,Zone,"Well ID","Date"
    ORDER BY "Well ID"
	--, "PDEN TYPE"
	--, "Source"
	--, "Summary Type"
	, "Zone"
	, "Date"
	--, "Activity Type"
	;