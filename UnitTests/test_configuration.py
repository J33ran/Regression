import unittest
from configuration import Configuration


format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
class TestConfiguration(unittest.TestCase):

    def test_invalid_path(self):
        self.assertRaises(Exception, Configuration.load,'ABCTEMP.xml', format)

    def test_invalid_file(self):
        self.assertRaises(Exception, Configuration.load,'Configuration/gxdb.db', format)

    def test_normal(self):

        Configuration.load('Configuration/configuration.xml', format)

        self.assertEqual(Configuration.isql,'Temp/dbisql.com')
        self.assertEqual(Configuration.dbf,'Temp/gxdb.db')

        self.assertEqual(Configuration.pwd,'sql')
        self.assertEqual(Configuration.uid,'dba')

        self.assertEqual(Configuration.sourcedir,'SQL')
        self.assertEqual(Configuration.expecteddir,'Expected')

        self.assertEqual(Configuration.resultdir,'Results')
        self.assertEqual(Configuration.logdir,'Temp')
