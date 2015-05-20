from configuration import Configuration
from sqlmanager import SQLManager
import logging
import threading
import subprocess
import queue
from os import path

def make_command(relpath, resultfile):
    args = str(r'UID=') + Configuration.uid \
            + str(r';PWD=') + Configuration.pwd + str(r';DBF=') + Configuration.dbf #+ str(r'"')

    #command  = [Configuration.isql, r'-q', r'-c',  args, r'-onerror', r'continue', resultfile]
    command  = [Configuration.isql, r'-q', r'-c',  args, resultfile]
    logging.debug("command => %s" %(command))
    return command
    

class Executor(threading.Thread):
    """
    Executor 
    """
    __queue = queue.Queue()
    __semaphore = None

    @classmethod
    def get_queue(cls):
        return cls.__queue

    def __init__(self, relpath, name, semaphore):
        #try:
        super(Executor,self).__init__(name = name)


        #self.result = False
        self.relpath = relpath
        if Executor.__semaphore is None:
            Executor.__semaphore = semaphore
                    
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

        results = []
        try:
            sourcefile = path.join(Configuration.sourcedir, self.relpath)
            resultfile = path.join(Configuration.resultdir, self.relpath)

            output = "{0:80} {1}".format(self.relpath, "[Started]")
            logging.info("%s" %(output))
            results = SQLManager.process(sourcefile, Configuration.resultdir, self.relpath)

            command = make_command(self.relpath, resultfile)

            with Executor.__semaphore:
                subprocess.call(command)
                
            if (results): 
                (Executor.__queue).put(results)

        except Exception as e:
            logging.debug("executor thread exception: %s" %(e.args))
        except:
            logging.debug("executor thread unexpected errro")

        output = "{0:80} {1}".format(self.relpath, "[Finished]")
        logging.info("%s" %(output))