from os import path, makedirs
from configuration import Configuration
import sqlreader as reader
from xmlreader import XMLReader
import logging
import threading




class SQLExecutor(threading.Thread):
    """
    SQLExecutor 
    """
    __lock = threading.Lock()
    __cntlock = threading.Lock()
    __passed  = 0

    @classmethod
    def getPassed(cls):
        return cls.__passed

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
    #    with self.__cntlock:
    #        if (self.result == True):
    #           self.__passed = self.__passed +1
    #        self.__total = self.__total + 1

        #status = "[Pass]" if self.result else "[Fail]"
        #logging.info('%s ... %s' %(self.name,status))

    def run(self):
        """
            execute sql scipts and match the results
        """
        result = False
        try:
            source = path.join(Configuration.sourcedir, self.relpath)

            expected = path.join(Configuration.expecteddir, self.relpath + ".xml")
            resulted = path.join(Configuration.resultdir, self.relpath + ".xml")
    
            # Test whether result exists or create one.
            resdir = path.join(Configuration.resultdir, path.dirname(self.relpath)) 

            # synchronisation locking
            with self.__class__.__lock:
                if not path.exists(resdir):
                    makedirs(resdir)

            logging.info('run %s' %(self.name))
            result = True
        except:
            pass
        finally:
            status = "[Pass]" if result else "[Fail]"
            logging.info('%s ... %s' %(self.name,status))
            with self.__class__.__lock:
                if result == True:
                     self.__class__.__passed = self.__class__.__passed + 1 


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
