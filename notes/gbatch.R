library(GillespieSSA2)
library(ggplot2)
.progress <- "text"
parms <- c(beta = 5 , gamma = 1, N=100)
final_time <- 10
initial_state <- c(S = 99, I=1, R=0)
reactions <- list(
  reaction("beta*S*I/N",  c(S = -1, I=+1), name="transmission"),
  reaction("gamma*I",   c(I = -1, R = +1), name="recovery")
)
set.seed(1)

system.time(g1 <- ssa(initial_state,reactions,final_time,parms,
          method=ssa_exact(),
          sim_name="SIR"))

plot_ssa(g1) + geom_step()

s <- 101

gfun <- function() {
    set.seed(s <<- s+1) ## HACK
    res <- ssa(initial_state,reactions,final_time,parms,
               method=ssa_exact(),
               ## census_interval=0.1,
               sim_name="SIR")
    return(res)
}

g2 <-plyr::rlply(300,gfun(),
                 .progress=.progress)

save.image("gbatch.RData")
