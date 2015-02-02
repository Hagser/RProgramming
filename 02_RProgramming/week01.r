x<-read.csv("hw1_data.csv")
bado <- is.na(x[,"Ozone"])
badt <- is.na(x[,"Temp"])
bads <- is.na(x[,"Solar.R"])
good <- complete.cases(x)

noozone<-x[bado,]
notime<-x[badt,]
ozone<-x[good,]


o1<-mean(x[x["Month"]==6,"Temp"])

o2<-mean(ozone[ozone["Ozone"]>31 & ozone["Temp"]>90,"Solar.R"])

o3<-max(ozone[ozone["Month"]==5,"Ozone"])

tempoz<-tempo[x["Ozone"]>31]
tempox<-tempo[tempoz]

y<-mean(x[good,"Solar.R"],na.rm=TRUE)
