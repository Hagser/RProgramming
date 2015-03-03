##install.packages("kernlab")
library(kernlab); data(spam); set.seed(333)
smallSpam <- spam[sample(dim(spam)[1],size=10),]
spamLabel <- (smallSpam$type=="spam")*1 + 1
plot(smallSpam$capitalAve,col=spamLabel)


rule1 <- function(x){
      prediction <- rep(NA,length(x))
      prediction[x > 2.7] <- "spam"
      prediction[x < 2.40] <- "nonspam"
      prediction[(x >= 2.40 & x <= 2.45)] <- "spam"
      prediction[(x > 2.45 & x <= 2.70)] <- "nonspam"
      return(prediction)
}
table(rule1(smallSpam$capitalAve),smallSpam$type)

rule2 <- function(x){
      prediction <- rep(NA,length(x))
      prediction[x > 2.8] <- "spam"
      prediction[x <= 2.8] <- "nonspam"
      return(prediction)
}

table(rule2(smallSpam$capitalAve),smallSpam$type)
tbl1<-table(rule1(spam$capitalAve),spam$type)
table(rule2(spam$capitalAve),spam$type)
tbl2<-table(rule2(spam$capitalAve),spam$type)

tbl<-tbl1

sum(rule1(spam$capitalAve)==spam$type)
sum(rule2(spam$capitalAve)==spam$type)

TP<-tbl[[1,1]]
FP<-tbl[[1,2]]
FN<-tbl[[2,1]]
TN<-tbl[[2,2]]

sens<-TP/(TP+FN) #sensitivity
spec<-TN/(FP+TN) #specificity
pospred<-TP/(TP+FP) #Positive Predictive Value
negpred<-TN/(FN+TN) #Negative Predictive Value
acc<-(TP+TN)/(TP+FP+FN+TN) #Accuracy

