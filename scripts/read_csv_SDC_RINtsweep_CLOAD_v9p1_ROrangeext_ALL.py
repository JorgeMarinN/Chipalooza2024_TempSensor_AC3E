#https://stackoverflow.com/questions/46614526/how-to-import-a-csv-file-into-a-data-array
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt

def calculate_linearity_error(x, y):
    # Calculate the coefficients (slope and intercept) of the linear regression line
    slope, intercept = np.polyfit(x, y, 1)

    # Calculate the predicted y values using the linear regression equation
    y_pred = slope * np.array(x) + intercept

    # Calculate the linearity error for each point
    linearity_errors = np.abs(np.array(y) - y_pred)

    # Find the maximum linearity error
    max_linearity_error = np.max(linearity_errors)

    return max_linearity_error, slope, intercept, y_pred





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

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_tm25.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_tm25.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_tm25.csv").values
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
DOUT2 = np.mean(newarry)
	
print(DOUT2)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_tm10.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_tm10.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_tm10.csv").values
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
DOUT3 = np.mean(newarry)
	
print(DOUT3)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t5.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t5.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t5.csv").values
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
DOUT4 = np.mean(newarry)
	
print(DOUT4)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t20.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t20.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t20.csv").values
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
DOUT5 = np.mean(newarry)
	
print(DOUT5)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t35.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t35.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t35.csv").values
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
DOUT6 = np.mean(newarry)
	
print(DOUT6)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t50.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t50.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t50.csv").values
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
DOUT7 = np.mean(newarry)
	
print(DOUT7)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t65.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t65.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t65.csv").values
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
DOUT8 = np.mean(newarry)
	
print(DOUT8)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t80.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t80.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t80.csv").values
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
DOUT9 = np.mean(newarry)
	
print(DOUT9)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t95.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t95.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t95.csv").values
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
DOUT10 = np.mean(newarry)
	
print(DOUT10)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t110.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t110.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t110.csv").values
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
DOUT11 = np.mean(newarry)
	
print(DOUT11)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t125.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t125.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t125.csv").values
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
DOUT12 = np.mean(newarry)
	
print(DOUT12)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t140.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t140.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t140.csv").values
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
DOUT13 = np.mean(newarry)
	
print(DOUT13)

#################################################################

df=pd.read_fwf('SDC_RINsweep_v9p1_CLOAD_t155.txt')
df.to_csv('SDC_RINsweep_v9p1_CLOAD_t155.csv', index=False)
data = pd.read_csv("SDC_RINsweep_v9p1_CLOAD_t155.csv").values
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
DOUT14 = np.mean(newarry)
	
print(DOUT14)

#################################################################
	
#DOUT_ALL = [DOUT1,DOUT2,DOUT3,DOUT4,DOUT5,DOUT6,DOUT7,DOUT8,DOUT9,DOUT10,DOUT11,DOUT12,DOUT13,DOUT14]
DOUT_ALL = [DOUT1,DOUT2,DOUT3,DOUT4,DOUT5,DOUT6,DOUT7,DOUT8,DOUT9,DOUT10,DOUT11,DOUT12]	
#x = [-40,-25,-10,5,20,35,50,65,80,95,110,125,140,155]	
x = [-40,-25,-10,5,20,35,50,65,80,95,110,125]
	
np.savetxt("DATA_RINtsweep_v9p1.csv", DOUT_ALL, delimiter=",")

max_error, slope, intercept, y_pred = calculate_linearity_error(x, DOUT_ALL)

# plot points not lines
#plt.plot([1.7,1.72,1.74,1.76,1.78,1.8,1.82,1.84,1.86,1.88,1.9,1.92,1.94,1.96,1.98,2],DOUT1,linestyle="",marker="o", label='27°C')
#plt.plot([-40,-25,-10,5,20,35,50,65,80,95,110,125,140,155],DOUT_ALL,linestyle="",marker="x")
#plt.plot(x,DOUT_ALL)
plt.scatter(x, DOUT_ALL, label='Original Data')
plt.plot(x, y_pred, color='red', label='Linearized Curve')
plt.xlabel("Temperature [°C]")
plt.ylabel("DOUT_average_CLOAD")
#plt.title('Linearized Curve with Original Data')
#plt.legend()
#plt.grid(True)
plt.show()


print("Maximum Linearity Error [%FS]:", max_error*100/1.8)
print("Slope:", slope)
print("Intercept:", intercept)

#plt.plot([1.9e-12,1.92e-12,1.94e-12,1.96e-12,1.98e-12,2e-12,2.02e-12,2.04e-12,2.06e-12,2.08e-12,2.1e-12],frq)
#plt.show()
#2.489e-9 - 1.466e-9
#1.9829e-8 - 1.8802e-8
