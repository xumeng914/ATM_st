load("D:/R_project/ATM_st/weather.RData")
a<-weather$weather %in% c("晴","晴~多云","多云","多云~阴","阴~多云","多云~晴","阴") & weather$max < 35
w <- cbind(weather,a)

data_12_MTH_DAY_SMY$day <- as.Date(data_12_MTH_DAY_SMY$date,"%Y%m%d")

All<- merge(data_12_MTH_DAY_SMY,w,by="day")
