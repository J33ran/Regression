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
            cls.loglevel = reader.find(r'loglevel')
            cls.expecteddir = reader.find(r'expected')
            cls.sourcedir = reader.find(r'source')
            cls.resultdir = reader.find(r'result')
            cls.logdir = reader.find(r'log')

            #sybase
            cls.isql = reader.find(r'dbisql')
            cls.uid = reader.find(r'uid')
            cls.pwd = reader.find(r'pwd')
            cls.dbf = reader.find(r'dbf')

            level = getattr(logging, cls.loglevel.upper())

            if not isinstance(level, int):
                raise Exception("Invalid log value")

            #logfile = str(r"{0}\regression.log".format(cls.logdir))
            #logging.basicConfig(filename=logfile, filemode='w'
            #                , level=level, format='%(asctime)s %(message)s')
        except Exception as e:
            logging.info("Exception occured while reading configuration")
            raise Exception(e)

if __name__ == "__main__":
    try:
        Configuration.load(r"Configuration.xml")
    except Exception as e:
        logging.info("%s" %(e.args))

    
    #read('feed.xml')
    #sqlblocks = read(r'T.sql')