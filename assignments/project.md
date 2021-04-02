---
title: "final project info"
---

### Table of contents

* [final document](#final)
* [presentation](#presentation)
* [milestone 2](#milestone2)
* [milestone 1](#milestone1)
* [initial draft](#draft0)
* [rubric](#rubric)

## Final submission

<a name="final/">

**Please ask for clarification of any points below that are unclear or incomplete.**

- **Due date**: Weds April 28
- Your complete final assignment must contain at least some component of replication and some of novel modeling, but the balance is up to you. 
- See the [rubric](#rubric) below: in particular,
   - your project should include some component of replication and some of extension/novel modeling; the precise balance is up to you.
   - your project should definitely include some analytical component and some computational component (and possibly a data-analysis/parameter-estimation component); the balance is up to you.
- Submit a *single* PDF document of somewhere around 5-15 pages, inclusive of figures and references; content is more important than length, please don't try to pad your document. Please cite all sources that you used; online sources can be cited as URLs, while peer-reviewed material should be completely/fully cited in any reference style you prefer. 
- In addition, submit complete code in one or more files that would allow complete replication of your results (data files, code, etc.). These can be in any reasonable format (e.g. {`.ipynb`, `.py`, `.R`, `.Rmd`} for code; {`.csv`, `.pkl`, `.RData`, `.rds`} for data).

## Presentation

<a name="presentation/">

- Your group will give a presentation in class on either **Monday April 12** or **Wednesday April 14** (if you have a preference, please ask me: first come first serve!)
- Aim for a presentation of about 20 minutes.
- The target audience for your presentation is your classmates; please assume that everyone knows the material taught in this course and in MATH 3F03 and don't re-cover it, except in passing. Please **do** explain anything that your group learned in the course of doing the project that you didn't already know (even where this conflicts with the previous criterion). Aim to cover the biological context/inspiration for the model(s) you're presenting and the main mathematical or computational points covered in the project. What challenges did you overcome, what did you learn, what did you find most interesting about the project? What were the conclusions of the paper you replicated, and of your extensions to it?
- Beamer or similar computationally driven formats are strongly preferred (e.g. see [here](https://opensource.com/article/20/9/presentation-jupyter-notebooks) or [here](https://opensource.com/article/20/9/presentation-jupyter-notebooks) for creating presentations from Jupyter notebooks, [here](https://rmarkdown.rstudio.com/lesson-11.html) for presentations from Rmarkdown, or [here](https://www.overleaf.com/learn/latex/Beamer_Presentations:_A_Tutorial_for_Beginners_(Part_1)%E2%80%94Getting_Started) for basic Beamer presentations. Powerpoint will be tolerated.

## Milestone 2

<a name="milestone2/">

You should demonstrate continued progress with your replication attempt, and/or progress on your novel component.

## Milestone 1

<a name="milestone1/">

See [replication exercise](./replication.md)

## Draft

<a name="draft0/">

**Due**: 24 Feb, midnight, on Dropbox or by e-mail.  (If you have already submitted your project proosal, you can re-submit it if you like but are not required to.)

Please submit a half- to one-page document (in PDF, HTML, plain text, or markdown format), as a group. Submit a single document by e-mail or on Avenue, the document should list the group members' names.

Note this is a **draft**: I don't necessarily expect your final project to follow your current proposal.

Tell me what area of math biology you want to tackle for your project. Let me know some or all of the following:

* what biological questions you want to try to explore/answer?
* what mathematical, computational, or statistical techniques you plan to use?
* what mixture (approximately) do you think your project will comprise of mathematical, computational, statistical, and biological content?
   * ideally your project should include at some of all of these components, but the weighting on each is up to you.
* your intended approach to parameters: which of the following?
   * try to establish generic properties of the system that depend only on qualitative aspects of the parameters (e.g. Levins models emphasizing "generality"); e.g. deriving stability thresholds/bifurcation diagrams that depend only on unitless parameters or parameter comparisons (e.g. whether $\beta$ is positive or negative, or ${\mathcal R}_0$ is greater or less than 1
   * establish reasonable, order-of-magnitude ranges for the parameters and explore the space computationally
   * get reasonable quantitative values of the parameters from somewhere (published paper, preprint, etc.)
   * estimate the parameters (roughly/by eye or using some kind of optimization) from some data set
* list one or two related references. Ideally, this would include a published paper whose results you can replicate as the first step of your project.

## Final project marking rubric

<a name="rubric/">

* **A**: Either a thorough analysis/exploration of a moderately complex/sophisticated model, or analyses of several related, simpler models that give different perspectives on the problem. Presents at least some analytical results, possibly for a simplified version of the model, and at least some computational results, possibly for a more complex version of the model. The problem and the model are clearly described. The results are illustrated with sensible plots. If the model used is reconstructed from a paper, then some sensible/interesting extension of the original model is included.  Model parameters are clearly described and sensibly handled (whether qualitative or quantitative). The report is clearly and succinctly written, with a connection back from the mathematical (etc.) results to their biological meaning.
* **B**: A thorough analysis of a simple model.  May include only analytical or only computational results, but these results must be solid. The problem and the analysis are still clearly described. A reconstruction of a complex or several-part model from the literature without any extensions or new material would fall in this category. Approach to choosing parameter values is clearly identified, but not very deep or thorough (e.g. "we took the parameters from reference 5").  Biological conclusions are included, but are perfunctory.
* **C**: A partial analysis of a simple model.  The basic information about the model is included, but either the model is extremely simple (and no variants or more complex versions are attempted) or the analysis is limited --- for example, implementing a simple model in R and showing a single run of the model, without exploring the results (dependence on parameter values, variations of the model, etc.)
* **D/F**: little evidence of effort. You never asked for help in formulating or evaluating the model (it's fine not to ask for help if you don't need it, but I will be much more generous in marking projects that are otherwise weak if I know that you really tried!)

