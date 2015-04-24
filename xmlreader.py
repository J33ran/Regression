"""
It defines XMLReader class which primarily 
features xml's loading and parsing funtionality.
"""
from xml.etree.ElementTree  import parse
import xml.etree.ElementTree

def main():
    
    import logging
    logging.basicConfig(filename=r'c:\regression.log', filemode='w', level=logging.DEBUG, format='%(asctime)s %(message)s')
    equal = XMLReader.compare(r"C:\Temp\a.xml", r"C:\Temp\b.xml")
    logging.debug("Unexpected error raised");
    print("Result =>",equal)

'''
    
    # IOError
    XMLReader(r'feed13.xml')
    # ParseError
    XMLReader(r'T.sql')
    #Positive case
    reader = XMLReader(r'feed.xml')
    print(reader.find('published'))
    #Invalid element
    print(reader.find('abcdef'))
'''



class XMLReader(object):
    """
    XMLReader
    """
    def __init__(self,filename):
        assert(filename)
        self.root = parse(filename).getroot()
        
    def getroot(self):
        return self.root

    def find(self,element):
        """
            find(element) in tree.
            returns *element* text or empty str()
        """
        assert(element)
        return self.root.find(element).text
     
        

    @staticmethod 
    def compare_tree(ltree, rtree):
        """
            compares two xml(param1,param2) tree.
            returns True if both trees are equal.
        """
        
        # tags must be same
        if (ltree.tag != rtree.tag):
            raise Exception("Tags do not match:{0} and {1}".format (ltree.tag, rtree.tag))
                
        # test ltree attribute for each rtree attribute 
        for name, value in ltree.attrib.items():
          if (ltree.attrib.get(name) != value):
                raise Exception("Attributes do not match: {0}={1}, {2|={3}" .format(name, value, name, rtree.attrib.get(name)))

        # All rtree attibs are must ltree attributes
        for name in rtree.attrib.keys():
                if name not in ltree.attrib:
                    raise Exception("rtree has an attribute ltree is missing: {0}".format(name))

        # Text must be same
        if not (ltree.text == rtree.text):
            raise Exception("text: {0} != {1}".format(ltree.text, rtree.text))
                
        #if not self.text_compare(x1.tail, x2.tail):
        #    logging.debug('tail: %r != %r' % (x1.tail, x2.tail))
        #    return False

        cl1 = ltree.getchildren()
        cl2 = rtree.getchildren()

        if len(cl1) != len(cl2):
            raise Exception("children length differs, {0} != {1}".format(len(cl1), len(cl2)))
                
        for c1, c2 in zip(cl1, cl2):               
            XMLReader.compare_tree(c1, c2)

    @classmethod
    def compare(cls, lfile, rfile):
        """
            Compares two xml files
            :param x1: the first xml file.
            :param x2: the second xml file.
            :return:
                True if both files match.
            """
        equal = True
        try:
            rtree= XMLReader(rfile).getroot()
            ltree = XMLReader(lfile).getroot()

            XMLReader.compare_tree(ltree, rtree)

        except Exception as e:
            equal = False
            #logging.debug("Exception raised =>", e.args);
            print("Exception raised =>", e.args);
        except:
            logging.debug("Unexpected error raised");

        return equal
        

if __name__ == "__main__":
    main()
    




