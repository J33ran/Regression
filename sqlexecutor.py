from os import path
from configuration import Configuration

def execute(relpath):
    """
        execute sql scipts and match the results
    """
    source = path.join(Configuration.sourcedir, relpath)
    expected = path.join(Configuration.expecteddir, relpath)
    result = path.join(Configuration.resultdir, relpath)

    print("src => ", source)

    #print (path.exists(filepath))
    #    print(filepath)


if __name__ == "__main__":
    pass
    #sqlblocks = sqlexecute(r'T.sql')
