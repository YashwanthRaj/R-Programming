rm(list=ls()) 
setwd("F:/6th Sem/CSE3506 - Essentials of Data Analytics/Lab/Datasets") 
dat1=read.csv("CreditWorthiness_5.csv") 
str(dat1) 
dat1$Ndepend=as.factor(dat1$Ndepend) 
dat1$creditScore=as.factor(dat1$creditScore) 
str(dat1) 
set.seed(341) 
dat2=sample(2,nrow(dat1),replace=T,prob=c(0.73,0.27)) 
train=dat1[dat2==1,] 
tst=dat1[dat2==2,] 
model=glm(creditScore~Loan.required+age+inPlans+Ndepend, data = train, 
          family='binomial') 
summary(model) 
model <- glm(creditScore~Loan.required+age, data = train, family = 'binomial') 
summary(model) 
pre=predict(model,train,type='response') 
head(pre) 
head(train) 
