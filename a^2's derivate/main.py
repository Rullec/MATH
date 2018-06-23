# 2018/6/21 23:02 in TJU-409
# When i want to prove the Gauss-Lucas theorem in complex analysis, I try to know what the funcion F = a^2 's nth derivate is...
# but i have no idea, what i can only do is write a program to display it...in python
import numpy as np
from math import log


def Cal(now):
    tmp = np.zeros((now.shape[0]*2, 2))
    for i in range(now.shape[0]):
        tmp[i * 2][0] = now[i][0] + 1
        tmp[i * 2][1] = now[i][1]
        tmp[i * 2 + 1 ][0] = now[i][0]
        tmp[i * 2 + 1][1] = now[i][1] + 1
    for i in range(len(tmp)):
        if tmp[i][0]>tmp[i][1]:
            t = tmp[i][0]
            tmp[i][0] = tmp[i][1]
            tmp[i][1] = t
    return tmp

def disp(now):
    print("N=%d:" % (log(now.shape[0], 2)+1), end="")
    resstr = ""
    for i in range(now.shape[0]):
        resstr = resstr + "%d%d " % (now[i][0], now[i][1])
    print(resstr)
    tmp = resstr.split()
    array = []
    for i in tmp:
        if 0 == array.count((i, tmp.count(i))):
            array.append((i, tmp.count(i)))
    print(array)

now = np.array([[0,1]])
N = 12

res = []
res.append(now)

for i in range(1,N):
    now = Cal(now)
    res.append(now)
    disp(now)
    #print(now)
