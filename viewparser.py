"""
It defines XMLReader class which primarily 
features xml's loading and parsing funtionality.
"""
from xml.etree.ElementTree  import parse
from os import path
import getopt
import sys

def usage():
    smesg =("Help: -p or --parse=view.xml") 
    raise getopt.GetoptError(smesg)


def main():
    try:

        opts, args = getopt.getopt(sys.argv[1:], "hp:", ["help", "parse="])
        filepath = str()

        if not opts:
            usage()

        for opt, arg in opts:
            if opt in ("-h", "--help"): 
                usage()
            elif opt in  ("-p", "--parse"):
                filepath = arg

        assert(filepath)

        #filepath = str(r'C:\Temp\View\view.xml')
        outdir = path.dirname(filepath)

        root = parse(filepath).getroot()
        view = str()

        for child in root:
            view = (child[1].text)

            found = view.upper().find(r"AS")

            if (found != -1):

                header = view[:found]
                name = (header.split(".")[1]).rstrip() + str(".sql")

                outname = path.join(outdir, name)
                view = view[found + len( "AS"):].lstrip()                
                with open(outname, 'w') as fd:
                    fd.writelines(view)

    except (getopt.GetoptError, Exception) as e:
        print("Exception %s" %str(e))
    except:
        print("Fatal error occured.")


if __name__ == "__main__":
    main()
