from os import path, makedirs,system
from configuration import Configuration
from sqlmanager import SQLManager
from xmlreader import XMLReader
import logging
import threading
import subprocess

def command(relpath, resultfile):
    args = str(r'UID=') + Configuration.uid \
            + str(r';PWD=') + Configuration.pwd + str(r';DBF=') + Configuration.dbf #+ str(r'"')

    #command  = [Configuration.isql, r'-q', r'-c',  args, r'-onerror', r'continue', resultfile]
    command  = [Configuration.isql, r'-q', r'-c',  args, resultfile]
    logging.debug("command => %s" %(command))
    subprocess.call(command)


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

            logging.info("Processing => %s" %(self.relpath))
            resultfiles = SQLManager.process(sourcefile, Configuration.resultdir, self.relpath)

            logging.info("Executing => %s" %(self.relpath))
            command(self.relpath, resultfile)

        except:
            resultfiles = []
        
        return resultfiles
        


