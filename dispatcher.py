from xmlreader import XMLReader
import logging
from configuration import Configuration
import threading

#get_loglevel = Configuration.get_loglevel

class Dispatcher(threading.Thread):
    __total = 0
    __pass = 0
    __lock = threading.Lock()

    @classmethod
    def get_total(cls):
        return cls.__total

    @classmethod
    def get_pass(cls):
        return cls.__pass

    def __init__(self, name, expectfile, resultfile):
        super(Dispatcher, self).__init__(name = name)

        self.resultfile = resultfile
        self.expectfile = expectfile

    def run(self):
        """
            execute sql scipts and match the results
        """
        result = False
        try:

            result = XMLReader.compare(self.expectfile, self.resultfile)

        except:
            logging.debug("Unknown exception occured")
        finally:
            status = "[Pass]" if (result == True) else "[Fail]"
            logging.info("%s => %s" %(self.resultfile, status))

            # synchronisation locking
            with  Dispatcher.__lock:
                if (result ==  True):
                    Dispatcher.__pass = Dispatcher.__pass + 1
                Dispatcher.__total = Dispatcher.__total + 1
        