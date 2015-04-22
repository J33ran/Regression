"""
This module defines XmlReader class which primarily supports xml's
reading and searching features.
"""
import sys
import xml.etree.ElementTree as etree

class XmlReader(object):
    """XmlReader
       XmlReader.search(str) returns element value or null.
    """
    def __init__(self,filename):
        try:
            assert(filename)
            self.root = etree.parse(filename).getroot()
        except etree.ParseError as e:
            print (filename,"ParseError({0}): {1}".format(e.code, e.position))
        except IOError as e:
                print (filename,"=> I/O error({0}): {1}".format(e.errno, e.strerror))
        finally:            
            pass

    def find(self,element):
        """Return *element's* text if found"""
        text = str()
        try:
            assert(element)
            text = self.root.find(element).text
        finally:
            return text
       

if __name__ == "__main__":
    # IOError
    XmlReader(r'feed13.xml')
    # ParseError
    XmlReader(r'T.sql')
    #Positive case
    reader = XmlReader(r'feed.xml')
    print(reader.find('published'))
    #Invalid element
    print(reader.find('abcdef'))



