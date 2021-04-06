import pandas as pd
import numpy as np
import matplotlib.pyplot as pyplot
from scipy.integrate import odeint, solve_ivp
from scipy import optimize as optimize
import scipy.integrate as integrate
import sys
import pickle

# parms
a = 1.5
b = 1
c1 = 1 
c2 = 0.9
c3 = 1
c4 = 0.8
alpha1 = 0.5
alpha2 = 0.5
beta = 0.1
d2 = 0.2

# model
def LV_model(t,y,parms):
    x,y,z = y
    d1 = parms
    return (x*(a-b*x)-(c1*x*y)/(alpha1+x),-d1*y+(c2*x*y)/(alpha1+x)-(c3*z*y)/(alpha2+y+beta*z),(c4*z*y)/(alpha2+y+beta*z)-d2*z)

n0 = (1,1,1) #initial condition

def run_bif_iteration_x(b1,transient=400,maxt=500,dt=1, y0=n0):
    tvec = np.arange(transient, maxt, dt)
    bifret = solve_ivp(LV_model, t_eval=tvec, t_span=[0,maxt], y0=y0, args=(b1,))
    return(bifret.y)

    
def local_max0(ss):
    ans = []
    for i in range(len(ss)-2):
        if ss[i] < ss[i+1] and ss[i+1] > ss[i+2]:
            ans.append(ss[i+1])
    return ans       


## https://stackoverflow.com/questions/4624970/finding-local-maxima-minima-with-numpy-in-a-1d-numpy-array
## https://stackoverflow.com/questions/30597869/what-does-np-r-do-numpy
def local_max(a,bif_digits=None):
    a = np.array(a)
    ## np.r_ is fancy: could also convert back to a list, extend, convert back to array, compare ...
    decr = np.r_[a[1:]<a[:-1],False]
    incr = np.r_[False,a[:-1]<a[1:]]
    m =  a[incr & decr]
    if bif_digits!=None:
        m = np.unique(m.round(bif_digits))
    return m

## min, max, number of bifurcation steps
minb1 = 0.2
maxb1 = 0.5
nbif = 1000
b1vec = np.linspace(minb1,maxb1,nbif)
printbif = 200  ## print
## transient, max-t
biftransient = 4000
maxbift = 5000
bif_digits = 4
bifout = []

for i in range(nbif):
    if (i % printbif ==0):
        sys.stdout.write("*")
        sys.stdout.flush()
    try:
        r = run_bif_iteration_x(b1vec[i],transient=biftransient,maxt=maxbift,dt=0.1)
        lmax = [local_max(r[i,:],bif_digits) for i in range(r.shape[0])]
        bifout.append(lmax)
    except:
        print("bad")

T = np.linspace(0,0.5,nbif) # time axis in the plot

f = open("bifout.pkl","wb")
pickle.dump((b1vec,bifout), f)
