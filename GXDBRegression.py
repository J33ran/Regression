import sqlreader


if __name__ == "__main__":
    sqlblocks = sqlreader.read(r'T.sql')
    
    # read sql blocks
    for block in sqlblocks:
        print ("sql : ", block)
    
     
    



