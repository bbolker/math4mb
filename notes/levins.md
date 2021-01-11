---
title: "notes on Levins 1966"
bibliography: ../math4mb.bib
output: tufte_handout
---

On @levins_strategy_1966

## evolutionary population genetics models ("Robust and Non-robust Theorems")

Don't get too hung up on these; understand the main points if you have time, but this is **not** the main reason I'm asking you to read this paper! The first time through the paper, focus on the **results** from this section (i.e. (a) first paragraph of the section; (b) first para. on p. 425 (results of Model 1); (c) last *full* paragraph on p. 425 ("These two models differ ..."); (d) last paragraph on p. 426 (carrying over to p. 427); here "environmental uncertainty" means *temporal* variation while "certain but diverse environments" mean *spatial* variation.

- There is a fundamental difference between **spatial** averaging of fitness (which leads to an arithmetic average of the fitness of all phenotypes) and **temporal** averaging of fitness (which leads to a geometric average). As an example, consider a phenotype that has a 50% probability of fitness of $W_A=2$ and a 50% probability of fitness of $W_B=0$, depending whether it occupies environment $A$ or $B$ (which each have a frequency of 50%). 
   - If we distribute $N$ individuals randomly across a spatial landscape, $N/2$ of them will have fitness of 2, $N/2$ will have 0, the total population will have a fitness of 1 ($N$ offspring from $N$ individuals).
   - Not suppose that the environment $A$ and $B$ occur in sequence. The total fitness over two years is $\sqrt{W_A W_B}$=0. This idea generalizes considerably; as long as there is any non-zero probability of a fitness of zero, the expected long-term average fitness is zero --- it doesn't matter whether the alternation of environments is deterministic or stochastic.
This is why Levins says that the average fitness is $pW_1 + (1-p)W_2$ for spatial heterogeneity and $W_1^p W_2^{1-p}$ for temporal heterogeneity (and equivalently that the best strategy maximizes the log of this expression, $p \log W_1 + (1-p) \log W_2$).
- Model 1 is hard to understand without reading @levins_theory_1962 first: I think the key insight is that when the 'fitness set' (i.e. the region in the plane that represents the full set of **feasible** (physically possible) phenotypes) is concave, the fitness of the population can fall anywhere on the **convex** set that circumscribes (??) the fitness set (this is called $F'$, in contrast with the fitness set $F$). The biological meaning here is that this convex extensions represents **polymorphic** evolution strategies, i.e. genotypes that give rise to a mixture of phenotypes.

- p. 427: "As an example of a non-robust theorem": I believe that this assumes that $K$ is a **temporally variable** parameter. The geometric mean of a random variable is a *decreasing function* of its variance. If $\textrm{Var}(x(1-x/K))=V$, then multiplying by $r$ will make the overall variance in the rate of growth $r^2 V$, so a larger $r$ will make the variance larger $\to$ the geometric mean smaller (this is very rough; in particular, $r$ will also affect the variance of $x$, so we haven't really proved anything).  This paradox *might* be resolved by reparameterizing the model as $dx/dt = x (r-\alpha x)$ [@mallet_struggle_2012] ...

## references
