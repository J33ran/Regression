import sqlreader
import logging

def main():
    logging.basicConfig(filename='c:\example.log', filemode='w', level=logging.DEBUG)
    #logging.debug('This message should go to the log file')
    #logging.info('So should this')
    #logging.warning('And this, too')


if __name__ == "__main__":
    sqlblocks = sqlreader.read(r'T.sql')
    
    # read sql blocks
    for block in sqlblocks:
        print ("sql : ", block)
    
     
    



            