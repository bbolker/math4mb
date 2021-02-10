## binomial Reed-Frost model
nt <- 20        ## time steps
y0 <- c(S=99,I=1) ## starting values
S <- y0[["S"]]
I <- y0[["I"]]
p_i <- 0.02
res <- numeric(nt)  ## vector for results (np.zeros)
res[1] <- I
for (t in 2:nt) {
   new_inf <- rbinom(1,size=S,prob=1-(1-p_i)^I)  
   I <- new_inf
   S <- S - I
   if (I==0) break ## epidemic goes extinct
   res[t] <- I
}
