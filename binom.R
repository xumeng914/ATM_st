hist(d$qx)

u<-mean(d$qx)
fc<-sd(d$qx)
p<-1-fc/u
n<-u/p

pbinom(900,size=floor(n),prob=p)

x<- c(1:floor(n))
y <- dbinom(x,size=floor(n),prob=p)
plot(x, y, type = "l", xlab = "binom Deviate", ylab = "Density",  yaxs = "i",xlim = c(50000,200000))
