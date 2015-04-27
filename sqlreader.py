"""
SQLParsing module
"""

from sqlparse import SQLParseError, split, format

def read(sqlfile):
    """
    transform sql scripts into list.
    """
    assert(sqlfile)
    sqls= []
    try:
        # Open and read the file as a single buffer
        with open(sqlfile, 'r') as fd:
            buffer = fd.read()
    
        # sql block splits
        blocks = split(buffer)

        #remove comments and empty statements
        for block in blocks:
            x = format(block,strip_comments=True)
            if x: 
                sqls.append(x)
    except Exception as e:
        logging.info("SQLParseError %s, => %s" %(sqlfile,e.args))
    except:
        logging.info("Fatal error occured in %s" %(sqlfile))
    
    return sqls

   

if __name__ == "__main__":
    logging.info(read(r'feed13.xml'))
    logging.info(read(r'T.sql'))
    logging.info(read(r'feed.sql'))
