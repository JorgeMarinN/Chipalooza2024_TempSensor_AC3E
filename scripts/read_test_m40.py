#https://stackoverflow.com/questions/46614526/how-to-import-a-csv-file-into-a-data-array
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt

i = 0 # DOUT


df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_tm40.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_tm40.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_tm40.csv").values
num_rows, num_cols = data.shape
print(num_rows)
print(num_cols)
thres  = 0.2
x = data[:,i]
arrx = np.array(x)
y = data[:,i+1]
arry = np.array(y)
	
filter_arr = []


for element in arrx:
	if element > 1e-6:
		filter_arr.append(True)
	else:
		filter_arr.append(False)

newarrx = arrx[filter_arr]
newarry = arry[filter_arr]
newarry[newarry>thres] = 1.8
newarry[newarry<=thres] = 0
DOUT1 = np.mean(newarry)
	
print(DOUT1)


