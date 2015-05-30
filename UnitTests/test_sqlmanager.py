import unittest
from os import path
from sqlmanager import SQLManager


format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
class TestSQLManager(unittest.TestCase):

    def test_invalid(self):
        # Read
        self.assertRaises(IOError,SQLManager.read,'/C/.sql')
        self.assertRaises(AssertionError,SQLManager.read,'')

        # Write
        self.assertRaises(IOError,SQLManager.write,'/C/.sql', '')
        self.assertRaises(AssertionError,SQLManager.write,'','select 2;')

    def test_abnormal_transform(self):
        file = (r'Configuration/configuration.xml')
        buffer = SQLManager.read(file)

        types = [type for type,sql in SQLManager.transform(buffer)]
        self.assertTrue(not types)


    def test_normal_transform(self):
        file = (r'SQL/WellHeader/WellHeader.sql')
        buffer = SQLManager.read(file)

        types = [type for type,sql in SQLManager.transform(buffer)]

        self.assertEqual(types[0],'SELECT')
        self.assertEqual(types[1],'NAN')
        self.assertEqual(types[2],'SELECT')

    def test_process_normal(self):
        file = (r'SQL/WellHeader/WellHeader.sql')
        rpath = str(r'SQL/WellHeader')

        outfile = 'WellHeader.out.sql'
        outpath = path.join(rpath, outfile)

        files = SQLManager.process(file, rpath, outfile) 

        self.assertTrue(files)
        self.assertTrue(path.isfile(outpath))

if __name__=='__main__':
    pass

