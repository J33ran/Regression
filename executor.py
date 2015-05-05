from os import path, makedirs,system
from configuration import Configuration
from sqlmanager import SQLManager
from xmlreader import XMLReader
import logging
import threading
import subprocess

class Executor(threading.Thread):
    """
    Executor 
    """
    def __init__(self, relpath, name):
        #try:
        super(Executor,self).__init__(name = name)

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

        resultfiles = []
        pas = False
        try:
            sourcefile = path.join(Configuration.sourcedir, self.relpath)
            resultfile = path.join(Configuration.resultdir, self.relpath)
    
            # Test whether result exists or create one.
            resdir = path.join(Configuration.resultdir, path.dirname(self.relpath)) 

            # synchronisation locking
            #with self.__class__.__lock:
            if not path.exists(resdir):
                makedirs(resdir)

            resultfiles = SQLManager.process(sourcefile, Configuration.resultdir, self.relpath)

            args = str(r'UID=') + Configuration.uid \
                + str(r';PWD=') + Configuration.pwd + str(r';DBF=') + Configuration.dbf #+ str(r'"')


            if resultfiles:
                command  = [Configuration.isql, r'-c',  args, r'-onerror', r'continue', resultfile]
                logging.info("command => %s" %(command))
                subprocess.call(command)

        except:
            resultfiles = []
        
        return resultfiles
        


