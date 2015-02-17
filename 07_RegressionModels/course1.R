#course project

library(knitr)
data(mtcars)

aut<-subset(mtcars,mtcars$am==1)
man<-subset(mtcars,mtcars$am==0)

par(mfrow=c(2,2))

hist(aut$mpg,breaks=20)
hist(man$mpg,breaks=20)

plot(aut$mpg,aut$hp)
plot(man$mpg,man$hp)
