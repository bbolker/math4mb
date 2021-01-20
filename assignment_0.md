---
title: Math 4MB, winter 2021, assignment 0
output: tufte_handout
header-includes:
  - \hypersetup{colorlinks=true}
---


The purpose of this assignment is to make sure you have all of your coding/text processing tools set up. It is due in the dropbox on Avenue to Learn by class time (1:30 PM) on **Monday January 18**.  You need to submit two files: (1) a **source file** (Jupyter notebook [`.ipynb`] or Rmarkdown [`.Rmd`] or Sweave [`.Rnw`]) and (2) an **output file** (PDF).

One of the practical principles you will learn in this course is **reproducibility**: any coding, documents etc. that you produce need to be able to be replicated exactly by someone else who has access to appropriate versions of the software. Some typical points/tips about reproducibility:

- whatever your source format is, you should make sure to re-run all of the code from scratch in a clean session (to make sure that you haven't accidentally executed code chunks out of order or introduced additional variables or libraries). In a Jupyter notebook, `Kernel / Restart & Run All`: in RStudio, the `Knit` button will automatically do this, or `Session/Restart R` and (in the R console) `rmarkdown::render("yourfile.rmd")`.
- make sure to include any `import` statements (Python) or `library()` statements (R); it is best to put these statements at the *top* of your document
- if your code relies on external files, make sure that you use **relative** and not **absolute** file references. For example, if your data (.CSV) file is in the same file as your source file, use `pandas.read_csv("myfile.csv")` (Python) or `read.csv("myfile.csv")`, **NOT** `read.csv("C:\\Joe's Computer\\Math 4MB\\data\\myfile.csv")`. If your data live (e.g.) in a subdirectory, use `read.csv("data/myfile.csv")`.
- in R, do **not** use `setwd()` or `rm(list=ls())` in your code (see [here](https://www.tidyverse.org/blog/2017/12/workflow-vs-script/))

---

1. State the definition of the Pythagorean theorem, using proper LaTeX for the mathematical symbols.
2. Write code that reads the file `"pim_us_phila_city_1918_dy.csv"`, which you can download [here](../data/pim_us_phila_city_1918_dy.csv) into a data frame (in Python, `pandas.read_csv()`; in R, `read.csv()` or `dplyr::read_csv()`); assume that the file is in the current working directory.
3. Write code that numerically integrates the differential equation $dx/dt = rx-bt$ with outputs for $t=\{0, 0.1, \dots 10\}$, using the values `r=1`, `b=0.5`, `x(0)=0.1`. **Assign the numeric values to the variable symbols and use the symbols in your gradient function**: do **not** write your gradient function as `1*x - 0.5*t`. State what numerical integration method your code is using (e.g. "Euler", "Runge-Kutta", "LSODA").
