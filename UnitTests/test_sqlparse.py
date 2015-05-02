import unittest
from sqlreader import read


format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
class TestSQLReader(unittest.TestCase):

    def test_invalid_path(self):
        self.assertEqual(read('ABCTEMP.xml','FOO'), [])

    def test_invalid_file(self):
        self.assertEqual(read('Configuration/configuration.xml','Results'), [])

    def test_normal(self):
        sqls = read(r'SQL/WellHeader/WellHeader.sql','Results/2.xml')
        self.assertEqual(len(sqls), 1)

