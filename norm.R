
d <- subset(All,All$name=="A6891110" 
            & All$qx!=0 
            & All$a=="TRUE",
            select = c(6))




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

nn <- unique(All$name)

for (i in 1:292)
{
  d <- subset(All,All$name==nn[i]
              & All$qx!=0 
              & All$a=="TRUE",
              select = c(6))
  
 
  x <- d$qx
  png(paste("sun/",nn[i],".png",sep=""))
  h<-hist(x,
          breaks=12,
          col="red",
          xlab="Miles Per Gallon",
          main=paste(nn[i]," sun",sep=""))
  xfit<-seq(min(x), max(x), length=40)
  yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
  yfit <- yfit*diff(h$mids[1:2])*length(x)
  lines(xfit, yfit, col="blue", lwd=2)
  box()
  dev.off()
  
}
