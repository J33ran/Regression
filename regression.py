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
    resultfiles = []
    threads = []

    for (root, dirs, files) in os.walk(Configuration.sourcedir):
        for file in files:

            # path manipulation
            abspath = os.path.join(root, file)
            relpath = os.path.relpath(abspath, Configuration.sourcedir)

            # Resultdir
            resdir = os.path.join(Configuration.resultdir, os.path.dirname(relpath)) 

            # Create resultdir
            if not os.path.exists(resdir):
                os.makedirs(resdir)

            e = Executor(relpath, file)
            #e.run()
            e.start()
            threads.append(e)

    for t in threads: 
        t.join() 

    que = Executor.get_queue()

    while que.empty() != True:
        resultfiles = resultfiles + que.get()

    return resultfiles

def dispatch(resultfiles):

    threads = []
    for result in resultfiles:
        expectfile = os.path.join(Configuration.expecteddir, result)
        resultfile = os.path.join(Configuration.resultdir, result)

        t = Dispatcher("", expectfile, resultfile, result)
        t.start()
        threads.append(t)
                
    for t in threads:
        t.join()


    return(Dispatcher.get_pass(), Dispatcher.get_total())

def main():
    try:
        format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
        resultfiles = []
        pas = 0
        total = 0

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

        logging.info("="*100)
        logging.info("Regression started")
        logging.info("="*100)
        

        start_time = time()

        # Execute Scripts
        resultfiles = execute()

        
        logging.info("="*100)
        logging.info("Results")
        logging.info("="*100)
        

        # Dispatch results
        pas, total = dispatch(resultfiles)

        total_time = time() - start_time

        
        logging.info("="*100)
        logging.info("%d passed out of %d" %(pas, total))
        logging.info("Total elapsed time(secs) %.2f" %(total_time))
        logging.info("="*100)

    except (getopt.GetoptError, Exception) as e:
        logging.info("Exception %s" %str(e))
    except:
        logging.info("Fatal error occured.")

if __name__ == "__main__":
    main()
