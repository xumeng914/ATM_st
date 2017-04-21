hist(d$qx)

u<-mean(d$qx)
fc<-sd(d$qx)
p<-1-fc/u
n<-u/p

pbinom(900,size=floor(n),prob=p)

x<- c(1:floor(n))
y <- dbinom(x,size=floor(n),prob=p)
plot(x, y, type = "l", xlab = "binom Deviate", ylab = "Density",  yaxs = "i",xlim = c(50000,200000))


x<- c(1:floor(n))
y <- dnorm(x,mean=u,sd=fc)
plot(x, y, type = "l", xlab = "norm Deviate", ylab = "Density",  yaxs = "i",xlim = c(0,200000))

###############################################################
x <- d$qx
h<-hist(x,
        breaks=12,
        col="red",
        xlab="Miles Per Gallon",
        main="Histogram with normal curve and box")
xfit<-seq(min(x), max(x), length=40)
yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
box()


