"""
SQLParsing module
"""
import logging
import sqlparse

def read(sqlfile, resultfile):
    """
    transform sql scripts into list.
    """
    assert(sqlfile)
    sqls= []
    output = str("OUTPUT TO ") + str(resultfile) + str(" FORMAT XML")

    try:
        # Open and read the file as a single buffer
        with open(sqlfile, 'r') as fd:
            buffer = fd.read()
    
        # sql block splits
        blocks = sqlparse.split(buffer)

        #remove comments and empty statements
        for block in blocks:
            sql = sqlparse.format(block,strip_comments=True)
         
            # If sql is not empty
            if sql: 
                # all sql are command.
                command  = sql

                # if select statemnt add  output statement
                stmt = (sqlparse.parse(sql)[0]).get_type().upper()

                if (stmt == "UNKNOWN"): continue
                if (stmt.upper() == r"SELECT"):
                    command = command + output

                sqls.append(command)
    except Exception as e:
        logging.info("SQLParseError %s, => %s" %(sqlfile,e.args))
    except:
        logging.info("Fatal error occured in %s" %(sqlfile))
    
    return sqls

   

if __name__ == "__main__":
    s = read(r'Expected/feed.xml', 'Expected/config.txt')
    print(s)
    #logging.info(read(r'SQL/T.sql'))
