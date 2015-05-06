--ALTER VIEW "DBA"."WellStatuses" as
select distinct CURRENT_STATUS as Status
from WELL ORDER BY CURRENT_STATUS;
--with check option
