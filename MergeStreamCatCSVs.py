import shutil
import glob
import os
import pandas as pd


#import csv files from folder
path = r'F:/SPATIAL/EPA/StreamCat'
os.chdir(path)
allFiles = glob.glob(path + "/*.csv")
allFiles.sort()  # glob lacks reliable ordering, so impose your own if output order matters
with open('NLCD2019_AllRegions.csv', 'wb') as outfile:
    for i, fname in enumerate(allFiles):
        with open(fname, 'rb') as infile:
            if i != 0:
                infile.readline()  # Throw away header on all but first file
            # Block copy rest of file from input to output without parsing
            shutil.copyfileobj(infile, outfile)
            print(fname + " has been imported.")

# check that the number of rows checks out
nrows_in = 0
for i, fname in enumerate(allFiles):
    tempin = pd.read_csv(fname)
    nrows_in += len(tempin)
# 2647057

tempout = pd.read_csv('NLCD2019_AllRegions.csv')
nrows_out = len(tempout)
# 2647057

if nrows_in == nrows_out:
    print("file import happend correctly.")
