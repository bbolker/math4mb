## http://tbb.bio.uu.nl/rdb/grindR/
## browseURL("http://tbb.bio.uu.nl/rdb/grindR/tutorial.pdf")
while (!require("Grind")) {
    remotes::install_github("hansschepers/grindr")
}

model <- HRgrad_FS <- function(t, y, parms) {
    grad <- with(as.list(c(y,parms)),
         {
             c(x=3*x^2-x^3 + y - W,
               y = 1 - 5*x^2 - y)
         })
    return(list(grad))
}

p <- c(W=2)
s <- c(x=-1,y=0.5)
run(ymin=-25,tstep=0.1)
plane(xmin=-4,xmax=2,ymin=-30,ymax=1,tstep=0.01,portrait=TRUE)
plane(xmin=-3,xmax=-1,ymin=-30,ymax=-20,tstep=0.01,portrait=TRUE)
p1 <- newton(c(x=0.5,y=-4))
points(p1[["x"]],p1[["y"]],pch=2,col=6,cex=2,lwd=2)
## continue(p1,x="W",y="x",xmin=-2.5,xmax=3,ymax=2.5,step=-0.0001)
continue(p1,x="W",y="x",xmin=-2.5,xmax=3,ymax=2.5,step=+0.001)

## get a little more
p <- c(W=-2)
## found unstable point
p2 <- newton(c(x=0.5,y=-4))
continue(p2,x="W",y="x",xmin=-2.5,xmax=3,ymax=2.5,step=+0.001,
         add=TRUE)

## jump over problematic spot ...
p <- c(W=0.22)
p3 <- newton(c(x=0.5,y=-4))
continue(p3,x="W",y="x",xmin=-2.5,xmax=3,ymax=2.5,step=+0.001,
         add=TRUE)


