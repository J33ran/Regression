select WELL_FILE.UWI as "Well ID"
,WELL_FILE.FILE_NAME as "Document Name"
,WELL_FILE.FILE_TYPE as "Document Type"
,WELL_FILE.FILE_EXTENSION as "File Extension"
from DBA.WELL_FILE
ORDER BY "Well ID"
  , FILE_ID;