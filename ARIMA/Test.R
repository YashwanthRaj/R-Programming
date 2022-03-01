rm(list=ls())
setwd("F:/6th Sem/CSE3506 - Essentials of Data Analytics/Lab/Datasets")
library(forecast)
library(tseries)
temp <- read.csv("rainfallsydney.csv")
class(temp)
t_time <- ts(temp$rain_in_mm, start = c(2017), frequency = 12)
class(t_time)
autoplot(t_time)
adf.test(t_time, k=12)
#Auto-ARIMA
mypo = auto.arima(t_time,ic="aic",trace=TRUE)
mypo
myfc = forecast(mypo, h=12)
myfc
plot(myfc)
#Conventional ARIMA
t_time_d1 <- diff(t_time, difference=1)
adf.test(t_time_d1, k=12)
t_time_d1 <- diff(t_time, difference=2)
adf.test(t_time_d1, k=12)
pacf(t_time_d1)
acf(t_time_d1)
autoplot(t_time_d1)
tsmod <- Arima(y=t_time, order = c(0.5,1,0.5))
tsmod
forecast(tsmod, h=12)
autoplot(forecast(tsmod, h=12))

