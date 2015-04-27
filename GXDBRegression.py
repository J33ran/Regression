import sys
import os
import getopt
from sqlexecutor import execute
from configuration import Configuration
from threading import Thread
import os
#import threading


def usage():
    smesg =("Help: -c or --config=configuration.xml") 
    raise getopt.GetoptError(smesg)

def main():
    try:                                
        opts, args = getopt.getopt(sys.argv[1:], "hc:", ["help", "config="])
        source = str()

        if not opts:
            usage()

        for opt, arg in opts:                
            if opt in ("-h", "--help"): 
                usage()
            elif opt in  ("-c", "--config"):
                source = arg
                                        
        Configuration.load(source)

        for (root, dirs, files) in os.walk(Configuration.sourcedir):
            for file in files:
                abspath = os.path.join(root, file)
                relpath = os.path.relpath(abspath, Configuration.sourcedir)
                
                t = Thread(target=execute, args=(relpath,))
                t.start()
                
    except (getopt.GetoptError, Exception) as e:          
        print(e)
    except:
        print ("Fatal error occured")

if __name__ == "__main__":
    main()
    #sqlblocks = sqlreader.read(r'T.sql')
    
    # read sql blocks
    #for block in sqlblocks:
    #    print ("sql : ", block)
    
     
    



            