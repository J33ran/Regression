"""
It defines XMLReader class which primarily 
features xml's loading and parsing funtionality.
"""
from xml.etree.ElementTree  import parse, iterparse
import xml.etree.ElementTree
import logging

class XMLReader(object):
    """
        An interface reading and comparing
        xmls.
    """
    def __init__(self,filename):
        assert(filename)
        self.root = parse(filename).getroot()
        
    def getroot(self):
        return self.root

    def find(self,element):
        """
            Find(element) in tree.
            returns *element* text or empty str()
        """
        assert(element)
        return self.root.find(element).text
     
        

    @staticmethod 
    def compare_row(ltree, rtree):
        """
            Compares two xml tree (param1,param2) tree.
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

        #cl1 = ltree.getchildren()
        #cl2 = rtree.getchildren()

        #print("children = ", len(cl1))
        #if len(cl1) != len(cl2):
        #    raise Exception("children length differs, {0} != {1}".format(len(cl1), len(cl2)))
                
        #for c1, c2 in zip(cl1, cl2):               
        #    XMLReader.compare_rowc1, c2)

    @classmethod
    def compare(cls, lfile, rfile):
        """
            Compares two xml files
            :param x1: the first xml file.
            :param x2: the second xml file.
            :return:
                True if both files match.
        """
        equal = False
        try:
            # get an iterable
            rcontext = iterparse(rfile, events=("start", "end"))

            # turn it into an iterator
            rcontext = iter(rcontext)

            # get the root element
            revent, rroot = next(rcontext)
            rroot.clear()

            # get an iterable
            lcontext = iterparse(lfile, events=("start", "end"))

            # turn it into an iterator
            lcontext = iter(lcontext)

            # get the root element
            levent, lroot = next(lcontext)
            lroot.clear()

            for (levent, lelem), (revent, relem) in zip (lcontext, rcontext):

                if (levent != revent):
                     raise Exception("mismatch events : {0} != {1}".format(levent, revent))

                if (levent == "end" and lelem.tag  == 'row'):
                    lrow  = lelem.getchildren()
                    rrow  = relem.getchildren()

                    if (len(lrow) != len(rrow)):
                          raise Exception("children length differs, {0} != {1}".format(len(lrow), len(rrow)))

                    for l,r in zip(lrow, rrow):
                        XMLReader.compare_row(l, r)

                    lelem.clear()
                    relem.clear()

            # As each phase is Ok, so equal = True
            equal = True
        except Exception as e:
            logging.debug("Exception occured in XML compare %s" %(e))
        except:
            logging.debug("Unexpected error raised");

        return equal

if __name__  == "__main__":

    import time

    #lfile= str(r"D:\Samples\GXDBRegression\GXDBRegression\Results\FORMATION\FormationSources.sql_1.xml")
    #rfile = str(r"D:\Samples\GXDBRegression\GXDBRegression\Results\FORMATION\FormationSources.sql_1.xml")
    #####################################################################################################
    #lfile= str(r"D:\Samples\GXDBRegression\GXDBRegression\Results\FORMATION\OrderedFormations.sql_1.xml")
    #rfile= str(r"D:\Samples\GXDBRegression\GXDBRegression\Results\FORMATION\OrderedFormations.sql_1.xml")
    lfile = str("D:\Samples\GXDBRegression\GXDBRegression\Expected\WELL_ZONE_INTERVAL\WellZoneIntrvValueWithDepthsOuterJoin2.sql_1.xml")
    rfile = str("D:\Samples\GXDBRegression\GXDBRegression\Results\WELL_ZONE_INTERVAL\WellZoneIntrvValueWithDepthsOuterJoin2.sql_1.xml")
    
    start_time = time.clock()

    try:
            
        equal = XMLReader.compare(lfile, rfile)

    except Exception as e:
        print("Exception occured %s" %(e))
    except:
         print ("Exception occured");

    total_time = time.clock() - start_time
    print ("finished (secs) %.2f" %(total_time))
      
    
    
