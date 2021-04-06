import pickle
import numpy as np
import matplotlib.pyplot as plt

f = open("bifout.pkl", "rb")
b1vec, bifout = pickle.load(f)
f.close()

def plot_fun(param,fn,ylims=None, plot_sub=True, ext=".pdf"):
    """param: parameter to plot
    fn: file name
    ylims: y limits
    """
    b1vec_full = []
    bifout_full = []
    for i in range(len(b1vec)):
        b1vec_full.extend([b1vec[i]]*len(bifout[i][param]))
        bifout_full.extend(bifout[i][param])
#
## https://www.delftstack.com/howto/matplotlib/how-to-change-the-size-and-format-of-a-figure-in-matplotlib/
    plt.figure(figsize=(6,4))
    fig, ax = plt.subplots()
    plt.plot(b1vec_full,  bifout_full, marker=".", linestyle="", ms=0.02,c='blue');
    if ylims != None:
        plt.ylim(ylims)
    fig.savefig(fn+ext,dpi=200)
#
    b1vec_sub = np.array(b1vec_full)
    keep = (0.355 < b1vec_sub) & (b1vec_sub < 0.375)
    bifout_sub = np.array(bifout_full)[keep]
    b1vec_sub = b1vec_sub[keep]
#
    if not plot_sub: return None
    plt.figure(figsize=(3,3))
    fig, ax = plt.subplots()
    plt.plot(b1vec_sub,  bifout_sub, marker=".", linestyle="", ms=0.02,c='blue');
    if ylims != None:
        plt.ylim(ylims)
    fig.savefig(fn+"_sub"+ext,dpi=200)


plot_fun(0,"bifplot",ylims=[1.43,1.51], plot_sub=False)
