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
png("Histogram_with_normal_curve/mygraph.png")
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
dev.off()

pnorm(10,mean=mean(x), sd=sd(x))
qnorm(0.9,mean=mean(x), sd=sd(x)) 
##################################################################

nn <- unique(data_12_MTH_DAY_SMY$name)

for (i in 1:292)
{
  d <- subset(data_12_MTH_DAY_SMY,data_12_MTH_DAY_SMY$name==nn[i] & data_12_MTH_DAY_SMY$qx!=0,
              select = c(5))
 
  x <- d$qx
  png(paste("Histogram_with_normal_curve/",nn[i],".png",sep=""))
  h<-hist(x,
          breaks=12,
          col="red",
          xlab="Miles Per Gallon",
          main=paste(nn[i]," Histogram with normal curve and box",sep=""))
  xfit<-seq(min(x), max(x), length=40)
  yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
  yfit <- yfit*diff(h$mids[1:2])*length(x)
  lines(xfit, yfit, col="blue", lwd=2)
  box()
  dev.off()
  
}
