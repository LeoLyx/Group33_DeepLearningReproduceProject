import numpy as np
data1 = np.loadtxt("./result_dice_lambda2_5.txt")
data2=  np.loadtxt("./result_dice_lambda2.txt")
print('rundatanumber:',np.size(data1)/2)
x=0
y=0
for i in range(int(np.size(data1)/2)):
    x=x+data1[i][0]
    y=y+data1[i][1]
    
x=x/(np.size(data1)/2)
y=y/(np.size(data1)/2)
print('lamda=2.5:',x,'+-',y)


print('rundatanumber:',np.size(data2)/2)
x=0
y=0
for i in range(int(np.size(data2)/2)):
    x=x+data2[i][0]
    y=y+data2[i][1]
    
x=x/(np.size(data2)/2)
y=y/(np.size(data2)/2)
print('lamda=2:',x,'+-',y)
