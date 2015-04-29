"""
SQLParsing module
"""
import logging
import sqlparse
#from sqlparse import SQLParseError, split, format, sql

def read(sqlfile, resultfile):
    """
    transform sql scripts into list.
    """
    assert(sqlfile)
    sqls= []
    output = 'OUTPUT TO ' + str(resultfile)
    try:
        # Open and read the file as a single buffer
        with open(sqlfile, 'r') as fd:
            buffer = fd.read()
    
        # sql block splits
        blocks = sqlparse.split(buffer)

        #remove comments and empty statements
        for block in blocks:
            x = sqlparse.format(block,strip_comments=True)
         
            if x: 
                
                # get stmt type
                stmt = (sqlparse.parse(x)[0]).get_type()
                if (stmt.upper() == r"SELECT"):
                    sqls.append(x)
                    
                    # append out string otherwise not
                    pass
                #logging.info("SQL Statement type %s" %(stmt.get_type()))
                sqls.append(x)

    except Exception as e:
        logging.info("SQLParseError %s, => %s" %(sqlfile,e.args))
    except:
        logging.info("Fatal error occured in %s" %(sqlfile))
    
    return sqls

   

if __name__ == "__main__":
    #logging.info(read(r'feed13.xml'))
    logging.basicConfig(level=logging.INFO, format = '%(asctime)s  %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
    logging.info(read(r'SQL/T.sql'))
    #logging.info(read(r'feed.sql'))
