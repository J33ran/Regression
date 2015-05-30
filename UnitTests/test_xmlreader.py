import unittest
from xmlreader import XMLReader


class TestXMLReader(unittest.TestCase):

    def test_invalid_path(self): 
        self.assertRaises(IOError,XMLReader,'/C/.xml')

    def test_invalid_file(self):
         self.assertRaises(IOError,XMLReader,'ABCTEMP.xml')
         self.assertRaises(AssertionError,XMLReader,'')
         self.assertFalse(XMLReader.compare('/C/.xml',''))
         self.assertFalse(XMLReader.compare('', '/C/.xml'))

    def test_normal(self):
         self.assertTrue(XMLReader.compare(r'Expected/foo.xml', r'Expected/foo.xml'))
         self.assertFalse(XMLReader.compare(r'Expected/foo.xml', r'Expected/bar.xml'))
         self.assertFalse(XMLReader.compare(r'Expected/foo.xml', r'Expected/foo_rowdel.xml'))
         self.assertFalse(XMLReader.compare(r'Expected/bar.xml', r'Expected/bar_casechanged.xml'))
