## binomial Reed-Frost model
nt <- 20        ## time steps
y0 <- c(S=99,I=1) ## starting values
S <- y0[["S"]]
I <- y0[["I"]]
p_i <- 0.02  ## R0 == p_i*N == 2.0
res <- numeric(nt)  ## vector for results (np.zeros)
res[1] <- I
for (t in 2:nt) {
   new_inf <- rbinom(1,size=S,prob=1-(1-p_i)^I)  
   I <- new_inf
   S <- S - I
   if (I==0) break ## epidemic goes extinct
   res[t] <- I
}
plot(res,type="s")
## repeat
rfun <- function(nt=20, y0=c(S=99,I=1),p_i= 0.02) {
    res <- numeric(nt)  ## vector for results (np.zeros)
    res[1] <- y0[["I"]]
    I <- y0[["I"]]
    S <- y0[["S"]]
    for (t in 2:nt) {
       new_inf <- rbinom(1,size=S,prob=1-(1-p_i)^I)  
       I <- new_inf
       S <- S - I
       if (I==0) break ## epidemic goes extinct
       res[t] <- I
    }
    return(res)
}

rfun()

rmat <- replicate(100,rfun(y=c(S=9999,I=1), p_i=0.0002))
matplot(rmat, type="l", col=1, lty=1)
lines(rowMeans(rmat),col=2,lwd=4)

plot(table(colSums(rmat)))

#####
S = 99
p_i = 0.02
I = 1
## probability of no infections 
0.98^99
## generally
(1-p_i)^S
