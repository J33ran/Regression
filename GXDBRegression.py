import sys
import os
import getopt
from sqlexecutor import SQLExecutor
from configuration import Configuration
from threading import Thread
import os
import logging
from time import time


def usage():
    smesg =("Help: -c or --config=configuration.xml") 
    raise getopt.GetoptError(smesg)

def execute():
    """
        Execute method.
    """
    start_time = time()
    total = 0
    pas = 0
    for (root, dirs, files) in os.walk(Configuration.sourcedir):
        for file in files:

            # path manipulation
            abspath = os.path.join(root, file)
            relpath = os.path.relpath(abspath, Configuration.sourcedir)

            # must be single threaded so db state remain valid
            executor = SQLExecutor(relpath, file)
            result = executor.run()

            status = "[Pass]" if (result == True) else "[Fail]"
            logging.info("%s => %s" %(file, status))

            if (result == True):
                pas = pas + 1
            total = total + 1

    logging.info("%d passed out of %d" %(pas, total))
    logging.info("Total elapsed time(secs) %.2f" %(time() - start_time))

def main():
    try:
        format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
        threads = [] 

        logging.basicConfig(level=logging.INFO, format = format[0], datefmt=format[1])

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

        # Execute Scripts
        execute()
                
    except (getopt.GetoptError, Exception) as e:          
        logging.info("Exception %s" %(e))
    except:
        logging.info("Fatal error occured.")

if __name__ == "__main__":
    main()
    #sqlblocks = sqlreader.read(r'T.sql')
    
    # read sql blocks
    #for block in sqlblocks:
    #    print ("sql : ", block)
    
     
    



            