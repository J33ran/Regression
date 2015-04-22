import xml.etree.ElementTree as etree

class Configuration(object):

    def __init__ (self):
        pass

def read(filename):

    tree = etree.parse(filename)
    root = tree.getroot()

    for child in root:
        print (child.attrib)
    



if __name__ == "__main__":
    read('feed.xml')
    #sqlblocks = read(r'T.sql')