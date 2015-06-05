import os
import filecmp
from shutil import copy

sourcepath = str(r'D:\GXRegressionViews')
targetpath = str(r'D:\GXRegressionViews')
uniques = []
duplicates = []

targetDir= str(r'D:\GXRegressionViewsUnique')
 
for (root, dirs, files) in os.walk(sourcepath):
    for file in files:

        found = False
        for (_troot, tdirs, tfiles) in os.walk(targetpath):
            for tfile in tfiles:
                if  file.lower() == tfile.lower():
                    found = True
                    break

        if not found:
            src = os.path.join(root,file)
            basedir =  os.path.basename(root)
            target =  os.path.join(targetDir, basedir)

            ## Create resultdir
            if not os.path.exists(target):
                os.makedirs(target)
                 
            copy(src, target)
            uniques.append(file)
        else:
            duplicates.append(file)



print ("# of Uniques",len(uniques))
print ("# of Duplicates",len(duplicates))
print(duplicates)
                   