-- List of views on Table
SELECT S.table_name, V.view_def
    FROM SYSDEPENDENCY D
    JOIN SYSTAB S ON  (S.object_id = D.ref_object_id)
    JOIN SYSVIEW V ON (dep_object_id = view_object_id)
    WHERE S.table_name IN ('FORMATION')

       
OUTPUT TO C:\Temp\View\view.xml FORMAT XML;

