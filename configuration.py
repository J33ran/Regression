"""
Configuration represents user provided configuration
"""
from xmlreader import XMLReader
import logging

class Configuration(object):
    """
    Configuration
    """
    expecteddir = str()
    sourcedir = str()
    resultdir = str()
    

    isql = str()
    uid = str()
    pwd = str()
    dbf = str()

    @classmethod
    def load(cls, filename):
        try:
            reader = XMLReader(filename)

            #regression
            loglevel = reader.find(r'loglevel')
            expecteddir = reader.find(r'expected')
            sourcedir = reader.find(r'source')
            resultdir = reader.find(r'result')
            logdir = reader.find(r'log')

            #sybase
            isql = reader.find(r'dbisql')
            uid = reader.find(r'uid')
            pwd = reader.find(r'pwd')
            dbf = reader.find(r'dbf')

            level = getattr(logging, loglevel.upper())

            if not isinstance(level, int):
                logfile = str(r"{0}\regression.log".format(logdir))
                logging.basicConfig(filename=logfile, filemode='w'
                               , level=level, format='%(asctime)s %(message)s')
        except Exception as e:
            print("Exception occured while reading configuration")
            raise Exception(e)


if __name__ == "__main__":
    try:
        Configuration.load(r"Configuration.xml")
    except Exception as e:
        print(e.args)

    
    #read('feed.xml')
    #sqlblocks = read(r'T.sql')