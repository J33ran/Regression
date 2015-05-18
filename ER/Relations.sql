-- List referenced tables by TABLENAME(Foreign tables)
SELECT S.table_name
    FROM SYSTAB S
    JOIN SYSFKEY F ON  S.table_id = F.primary_table_id
    JOIN SYSTAB S1 ON  F.foreign_table_id =  S1.table_id 
    WHERE S1.table_name IN('GX_PDEN_VOL_SUM_BY_MONTH');

DESCRIBE GX_PDEN_VOL_SUM_BY_MONTH;
    
-- List tables referencing TABLENAME(Primary table)
SELECT S.table_name
    FROM SYSTAB S
    JOIN SYSFKEY F ON  S.table_id = F.Foreign_table_id
    JOIN SYSTAB S1 ON  F.primary_table_id =  S1.table_id 
    WHERE S1.table_name LIKE 'GX_PDEN_VOL_SUM_BY_MONTH';
  

-- List triggers on table.
SELECT T.trigger_name, T.trigger_defn
    FROM SYSTRIGGER T
    JOIN SYSTAB S ON  (S.table_id = T.table_id)
    WHERE S.table_name IN ('WELL_CHECKSHOT_DETAIL', 'WELL_DIR_SRVY_STATION', 'WELL_DIR_PROPOSED_SRVY_STATION') ;    

-- List of views on Table
SELECT S.table_name, V.view_def
    FROM SYSDEPENDENCY D
    JOIN SYSTAB S ON  (S.object_id = D.ref_object_id)
    JOIN SYSVIEW V ON (dep_object_id = view_object_id)
    WHERE S.table_name IN ('GX_PDEN_VOL_SUM_BY_MONTH');
    

    SELECT * FROM SYSDBSPACE;
    SELECT *   
    FROM SYSTAB S   
    WHERE S.table_name IN ('GX_PDEN_VOL_SUM_BY_MONTH', 'WELL_CHECKSHOT_DETAIL');
 
OUTPUT TO C:\Temp\View\view.xml FORMAT XML;

DESCRIBE GX_PRODUCTION_TEST ;
    
  
-- List PKs on table.
SELECT C.column_name, S.table_name
    FROM SYSCOLUMN C 
    JOIN SYSTAB S ON (C.table_id = S.table_id)
    WHERE C.pkey ='Y'
    AND S.table_name IN ('WELL_CORE');
    
    
DESCRIBE WELL_PERFORATION;

 

sp_helpconstraint 'WELL_DIR_SRVY_STATION'

CREATE PROCEDURE OuterProc()
BEGIN
   MESSAGE 'Hello from OuterProc.' TO CLIENT;
   CALL InnerProc();
   MESSAGE 'SQLSTATE set to ',
      SQLSTATE,' in OuterProc.' TO CLIENT
END;
CREATE PROCEDURE InnerProc()
   BEGIN
      DECLARE column_not_found
         EXCEPTION FOR SQLSTATE '52003';
      MESSAGE 'Hello from InnerProc.' TO CLIENT;
      SIGNAL column_not_found;
   MESSAGE 'SQLSTATE set to ',
      SQLSTATE, ' in InnerProc.' TO CLIENT;
END;

CALL OuterProc();
SELECT TRACEBACK();
/*    
CREATE OR REPLACE PROCEDURE DBA."TEST_TRACE"()
BEGIN
    MESSAGE 'Hello World' TO CLIENT;
END;

CALL TEST_TRACE();

CREATE OR REPLACE PROCEDURE DBA."TRUNC_SRVY_VEL_DIRS_STATS"()
BEGIN
-- Truncating surveys
    TRUNCATE TABLE "WELL_DIR_SRVY_STATION"; 
    TRUNCATE TABLE "WELL_DIR_SRVY";
    
-- Truncating proposed surveys.
     TRUNCATE TABLE "WELL_DIR_PROPOSED_SRVY_STATION";
     TRUNCATE TABLE "WELL_DIR_PROPOSED_SRVY";
    
-- Truncating Check shot tables.
    TRUNCATE TABLE "WELL_CHECKSHOT_DETAIL";
    TRUNCATE TABLE "GX_WELL_SYNTHETIC";
    TRUNCATE TABLE "WELL_CHECKSHOT_SURVEY";
END;

CALL TRUNC_SRVY_VEL_DIRS_STATS();

SELECT * FROM WELL_CHECKSHOT_DETAIL;
SElECT * FROM "WELL_DIR_PROPOSED_SRVY_STATION" WHERE UWI = 'pad 6';
*/
