from os import path, makedirs,system
from configuration import Configuration
import sqlreader
from xmlreader import XMLReader
import logging
import threading
import subprocess




class SQLExecutor(threading.Thread):
    """
    SQLExecutor 
    """
    def __init__(self, relpath, name):
        #try:
        super(SQLExecutor,self).__init__(name = name)

        #self.result = False
        self.relpath = relpath
        
        #except Exception as e:
        #    logging.info("Exception => %s" %(e.args))
        #except:
        #    logging.info("Fatal Exception.")
        #finally:

    #def __del__(self):
    #    if (self.result == True):
    #        self.__class__.__pass = self.__class__.__pass +1

    #    self.__class__.__total = self.__class__.__total + 1
    #    status = "[Pass]" if self.result else "[Fail]"

    #    logging.info('%s ... %s' %(self.name,status))

    def run(self):
        """
            execute sql scipts and match the results
        """
        pas = False
        try:
            source = path.join(Configuration.sourcedir, self.relpath)

            expect = path.join(Configuration.expecteddir, self.relpath + ".xml")
            result = path.join(Configuration.resultdir, self.relpath + ".xml")
    
            # Test whether result exists or create one.
            resdir = path.join(Configuration.resultdir, path.dirname(self.relpath)) 

            # synchronisation locking
            #with self.__class__.__lock:
            if not path.exists(resdir):
                makedirs(resdir)

            exe = Configuration.get_exe()
            sqls = sqlreader.read(source, result)

            # Execute commands
            args = str(r'"UID=') + Configuration.uid \
                + str(r';PWD=') + Configuration.pwd + str(r';DBF=') + Configuration.dbf + str(r'" ')

            #command  = [Configuration.isql, '-c',  args,
            for sql in sqls:
                #command = exe + sql
                command  = [Configuration.isql, '-c',  args, sql]
                if (sql):
                    logging.info("command => %s" %(command))
                    subprocess.call(command)
                    #system(command)

            pas = XMLReader.compare(expect, result)
        except:
            pas = False
        
        return pas
        


    # Run sql scripts


    # Test whether expected exists or not
    #comparison = XMLReader.compare(expected, resulted)
    #logging.info(path.

    
    #sqlstmts = reader.read(source, result)

    

    #print (path.exists(filepath))
    #    print(filepath)


if __name__ == "__main__":
    pass
    #sqlblocks = sqlexecute(r'T.sql')
