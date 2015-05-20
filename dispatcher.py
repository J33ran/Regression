from xmlreader import XMLReader
import logging
from configuration import Configuration
import threading

#get_loglevel = Configuration.get_loglevel

class Dispatcher(threading.Thread):
    __total = 0
    __pass = 0
    __semaphore = None
    __lock = threading.Lock()

    @classmethod
    def get_total(cls):
        return cls.__total

    @classmethod
    def get_pass(cls):
        return cls.__pass

    def __init__(self, name, expectfile, resultfile, relfilename, semaphore):
        super(Dispatcher, self).__init__(name = name)

        self.resultfile = resultfile
        self.expectfile = expectfile
        self.relfilename = relfilename

        if Dispatcher.__semaphore is None:
             Dispatcher.__semaphore = semaphore
             

    def run(self):
        """
            execute sql scipts and match the results
        """
        result = False
        try:
            logging.debug("Comparing => %s" %(self.name))

            with Dispatcher.__semaphore:
                result = XMLReader.compare(self.expectfile, self.resultfile)

        except:
            logging.debug("Unknown exception occured")
        finally:
            status = "[Pass]" if (result == True) else "[Fail]"
            output = "{0:80} {1}".format(self.relfilename, status)
            logging.info("%s" %(output))

            # synchronisation locking
            with  Dispatcher.__lock:
                if (result ==  True):
                    Dispatcher.__pass = Dispatcher.__pass + 1
                Dispatcher.__total = Dispatcher.__total + 1
        
