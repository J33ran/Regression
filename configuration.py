"""
Configuration represents user provided configuration
"""
from os import path
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
    exe = str()
    level = int()

    @staticmethod
    def path_exists(dir):
        if not path.exists(dir):
            raise Exception("Invalid path", dir)

    @staticmethod 
    def file_exists(file):
        if not path.isfile(file):
            raise Exception("Invalid path", file)

    #@staticmethod
    #def get_loglevel():
    #    return Configuration.level

    @classmethod
    def load(cls, filename, format):
        try:
            reader = XMLReader(filename)

            #regression
            loglevel = reader.find(r'loglevel')

            cls.expecteddir = reader.find(r'expected')
            cls.sourcedir = reader.find(r'source')
            cls.resultdir = reader.find(r'result')
            cls.logdir = reader.find(r'log')

            # directories must exist
            cls.path_exists(cls.expecteddir)
            cls.path_exists(cls.sourcedir)
            cls.path_exists(cls.logdir)
            cls.path_exists(cls.resultdir)

            #sybase
            cls.isql = reader.find(r'dbisql')
            cls.uid = reader.find(r'uid')
            cls.pwd = reader.find(r'pwd')
            cls.dbf = reader.find(r'dbf')

            cls.file_exists(cls.isql)
            cls.file_exists(cls.dbf)

            cls.exe = cls.isql +  str(r' -c "UID=') + cls.uid \
                + str(r';PWD=') + cls.pwd + str(r';DBF=') + cls.dbf + str(r'" ')

            cls.level = getattr(logging, loglevel.upper())

            if not isinstance(cls.level, int):
                raise Exception("Invalid log value")

            fh  = logging.FileHandler(str(r"{0}\regression.log".format(cls.logdir)))
            fh.setLevel(cls.level)

            formatter = logging.Formatter(fmt=format[0], datefmt=format[1])
            fh.setFormatter(formatter)

            logging.getLogger('').addHandler(fh)

        except Exception:# as e:
            logging.log("Exception occured while reading configuration")
            raise

