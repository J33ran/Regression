"""
SQLParsing module
"""
import logging
import sqlparse
from os import path

class SQLManager(object):

    @classmethod
    def read(cls, sqlfile):

        # Open and read the file as a single buffer
        assert(sqlfile)
        buffer = object()
        with open(sqlfile, 'r') as fd:
            buffer = fd.read()

        return buffer
    
    @classmethod
    def write(cls, resultfile, sqls):

        # Open and read the file as a single buffer
        assert(resultfile)
        with open(resultfile, 'w') as fd:
            for sql in sqls:
                fd.writelines(sql)

    @classmethod
    def process(cls, sqlfile, resultdir, relpath):
        
        outfiles = []
        sqls = []
        resultfile = path.join(resultdir, relpath)

        buffer = cls.read(sqlfile)

        for type, sql in cls.transform(buffer):
            
            sqls.append(sql)

            if (type == r'SELECT'):

                outname = "_{0}.xml".format(len(sqls))
                outrelpath = relpath + outname

                outfile = resultfile + outname
                out = str("OUTPUT TO ") + str(outfile) + str(" FORMAT XML")

                outfiles.append(outrelpath)
                sqls.append(out)

        cls.write(resultfile, sqls)
        return outfiles
                

    @classmethod
    def transform(cls, sqlbuffer):
        """
        transform sql scripts into list.
        """
        try:

            blocks = sqlparse.split(sqlbuffer)

            #remove comments and empty statements
            for block in blocks:
                sql = sqlparse.format(block,strip_comments=True)
         
                # If sql is not empty
                if sql: 
                    
                    # if select statemnt add  output statement
                    stmt = (sqlparse.parse(sql)[0]).get_type().upper()

                    if (stmt == "UNKNOWN"): continue

                    if (stmt.upper() == r"SELECT"):
                        sql_stmt = (r'SELECT', sql)
                    else:
                        sql_stmt = (r'NAN', sql)
                    
                    yield sql_stmt
                    ##c = sqlparse.format(sql, output_format="python")
                    #sqls.append(command)

                    #if (stmt.upper() == r"SELECT"):
                    #    outputfile = resultfile + "_{0}.xml".format(len(sqls))
                    #    output = str("OUTPUT TO ") + str(outputfile) + str(" FORMAT XML")
                    #    sqls.append(output)
    
        except Exception as e:
            logging.debug("SQLParseError %s, => %s" %(sqlfile,e.args))
            raise
        except:
            logging.debug("Fatal error occured in %s" %(sqlfile))
            raise

