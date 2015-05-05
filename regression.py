import sys
import os
import getopt
import logging

from executor import Executor
from configuration import Configuration
from threading import Thread
from time import time
from dispatcher import Dispatcher

def create_logger(format):
    
    formatter = logging.Formatter(fmt=format[0], datefmt=format[1])
    logging.getLogger('').setLevel(logging.DEBUG)

    ch = logging.StreamHandler()
    ch.setLevel(logging.INFO)

    ch.setFormatter(formatter)
    logging.getLogger('').addHandler(ch)


def usage():
    smesg =("Help: -c or --config=configuration.xml") 
    raise getopt.GetoptError(smesg)

def execute():
    """
        Execute method.
    """
    threads = []

    for (root, dirs, files) in os.walk(Configuration.sourcedir):
        for file in files:

            # path manipulation
            abspath = os.path.join(root, file)
            relpath = os.path.relpath(abspath, Configuration.sourcedir)

            # must be single threaded so db state remain valid
            executor = Executor(relpath, file)
            resultfiles = executor.run()

            
            for result in resultfiles:
                expectfile = os.path.join(Configuration.expecteddir, result)
                resultfile = os.path.join(Configuration.resultdir, result)

                t = Dispatcher("", expectfile, resultfile)
                t.start()
                threads.append(t)
                
    for t in threads:
        t.join()

def main():
    try:
        format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
        threads = [] 

        create_logger(format)
        opts, args = getopt.getopt(sys.argv[1:], "hc:", ["help", "config="])
        source = str()

        if not opts:
            usage()

        for opt, arg in opts:
            if opt in ("-h", "--help"): 
                usage()
            elif opt in  ("-c", "--config"):
                source = arg

        # Configurations init
        Configuration.load(source, format)

        start_time = time()
        # Execute Scripts
        execute()

        pas = Dispatcher.get_pass()
        total = Dispatcher.get_total()
        
        total_time = time() - start_time

        logging.info("%d passed out of %d" %(pas, total))
        logging.info("Total elapsed time(secs) %.2f" %(total_time))

    except (getopt.GetoptError, Exception) as e:
        logging.info("Exception %s" %(e))
    except:
        logging.info("Fatal error occured.")

if __name__ == "__main__":
    main()
