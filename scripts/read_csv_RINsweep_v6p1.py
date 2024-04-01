#https://stackoverflow.com/questions/46614526/how-to-import-a-csv-file-into-a-data-array
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt


df=pd.read_fwf('ringosc_RINsweep_v6p1.txt')
df.to_csv('ringosc_RINsweep_v6p1.csv', index=False)
data = pd.read_csv("ringosc_RINsweep_v6p1.csv").values
num_rows, num_cols = data.shape
print(num_rows)
print(num_cols)
thres  = 0.9
sw = [0,2,4,6,8,10,12,14,16,18,20]
frq=[0,0,0,0,0,0,0,0,0,0,0]
for i in sw:
	x = data[:,i]
	y = data[:,i+1]
	x=x[~pd.isnull(x)]
	y=y[~pd.isnull(y)]
	kk2=np.diff(y > thres, prepend=False)
	kk3=np.argwhere(kk2)[::2,0]
	lgt=kk3.shape
	j = int(i/2)
	frq[j]=lgt[0]/(x[kk3[-1]]-x[kk3[0]])
	print(lgt[0]/(x[kk3[-1]]-x[kk3[0]]))
	plt.plot(x,y)
plt.show()

#plt.plot([0,1,2,3,4,5,6,7,8,9,10],frq)
plt.plot([2,2.2,2.4,2.6,2.8,3,3.2,3.4,3.6,3.8,4],frq)
plt.xlabel("Rin [kOhm]")
plt.ylabel("Frequency [Hz]")
plt.show()
#2.489e-9 - 1.466e-9
#1.9829e-8 - 1.8802e-8
