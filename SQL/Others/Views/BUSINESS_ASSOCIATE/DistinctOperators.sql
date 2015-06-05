select distinct BUSINESS_ASSOCIATE.SOURCE as Source,
    BUSINESS_ASSOCIATE.BA_ID as Operator
    from DBA.BUSINESS_ASSOCIATE 
    ORDER BY Operator;
