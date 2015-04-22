import sqlparse

def read(sqlfile):

    sqls= list([])
    # Open and read the file as a single buffer
    fd = open(sqlfile, 'r')
    buffer = fd.read()
    fd.close()
    
    # sql block splits
    blocks = sqlparse.split(buffer)

   #remove comments and empty statements
    for block in blocks:
       x = sqlparse.format(block,strip_comments=True)
       if x: 
           sqls.append(x)
        
    return sqls

   

if __name__ == "__main__":
    sqlblocks = read(r'T.sql')