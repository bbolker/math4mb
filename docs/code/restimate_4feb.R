## Phila P&I mortality data from 1918
## (pneumonia and influenza data)
## estimating r (epidemic growth rate)
## = beta - gamma in SIR
pimdata <- read.csv("data/pim_us_phila_city_1918_dy.csv")
plot(pimdata$pim)

expdata <- pimdata[1:40,]
plot(expdata$pim)
curve(8*exp(x/8),add=TRUE)

plot(log(expdata$pim))
plot(expdata$pim,log="y")
abline(h=1:5,lty=2)

curve(x^2, from=0,to=1)
curve(exp(x)-1,from=0,to=2)
      ## add=TRUE,col=2)

expdat2 <- pimdata[15:32,]
plot(expdat2$pim,log="y")
expdat2$day <- 1:nrow(expdat2)
m1 <- lm(log(pim)~day, data=expdat2)
## D(t) = D(0)*exp(r*t)
## log(D(t)) = log(D(0)) + r*t
log(2)/coef(m1)[2]  ## doubling time
plot(log(pim)~day, data=expdat2)
abline(m1)
## pneumonia 