rm(list=ls())
#install.packages("dplyr")
library(dplyr) 
data <- mtcars
data<-sample_n(data,16) 
View(data)

#install.packages("ggplot2")
library(ggplot2)
ggplot(data,aes(x=disp,y=mpg))+geom_point() 

cor.test(data$disp,data$mpg)
slr=lm(mpg~disp,data) #simple linear regression between wt and mpg
summary(slr) #for summary or results
plot(slr$resid) #plot
attributes(slr) #attributes
coef(slr) #for the coefficient of the simple linear regression
confint(slr) #confint of simple linear regression
