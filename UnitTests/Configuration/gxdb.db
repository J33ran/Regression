import unittest
from configuration import Configuration


class TestConfiguration(unittest.TestCase):
    def test_load(self):
        format = ['%(asctime)s  %(message)s', '%Y-%m-%d %H:%M:%S']
        
        # invalid path
        Configuration.load('Configuration/configuration.xml', format)
        self.assertRaises(Exception)
        #return
        #Configuration.load('Configuration/configuration.xml', format)
