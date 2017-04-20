d <- subset(data_12_MTH_DAY_SMY,data_12_MTH_DAY_SMY$name=="A1891000",select = c(1,2,5,6))

tsales <- ts(d$qx, start=as.Date("2016-03-01"), frequency=1)
s <- as.Date("2016-03-01")
dates<-seq(from=s, by=1, length.out=length(d$qx)) 
library(tseries)
library(xts)
tsales <- data.frame(tsales)
rownames(tsales)=dates
tsales <- as.xts(tsales)
head(tsales)
plot(tsales)



library(forecast)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))
ylim <- c(min(tsales), max(tsales))
plot(tsales, main="Raw time series")
plot(ma(tsales, 3), main="Simple Moving Averages (k=3)", ylim=ylim)
plot(ma(tsales, 7), main="Simple Moving Averages (k=7)", ylim=ylim)
plot(ma(tsales, 15), main="Simple Moving Averages (k=15)", ylim=ylim)
par(opar)
################################################
################################################


d <- subset(data_12_MTH_DAY_SMY,data_12_MTH_DAY_SMY$name=="A1891000" & data_12_MTH_DAY_SMY$qx!=0,select = c(1,2,5,6))
tsales <- ts(d$qx, start=1, frequency=52)
library(forecast)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))
ylim <- c(min(tsales), max(tsales))
plot(tsales, main="Raw time series")
plot(ma(tsales, 3), main="Simple Moving Averages (k=3)", ylim=ylim)
plot(ma(tsales, 7), main="Simple Moving Averages (k=7)", ylim=ylim)
plot(ma(tsales, 15), main="Simple Moving Averages (k=15)", ylim=ylim)
par(opar)

plot(tsales)
ltsales <- log(tsales) ## 对数化 相乘模型
plot(ltsales, ylab="log(tsales)")
fit <- stl(ltsales, s.window="period")  # s.windows="periodic"可使得季节效应在各年间都一样
plot(fit)
fit$time.series
exp(fit$time.series)

fit <- ets(tsales, model="ANN")
forecast(fit, 1)
plot(forecast(fit, 1), xlab="Year",
     ylab=expression(paste("Temperature (", degree*F,")")),
     main="New Haven Annual Mean Temperature")
accuracy(fit)
