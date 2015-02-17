library(lattice)
library(datasets)
## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)


## Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))



p <- xyplot(Ozone ~ Wind, data = airquality) ## Nothing happens!
print(p) ## Plot appears


set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1)) ## Plot with 2 panels


## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
      panel.xyplot(x, y, ...) ## First call the default panel function for 'xyplot'
      panel.abline(h = median(y), lty = 2) ## Add a horizontal line at the median
})


## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
      panel.xyplot(x, y, ...) ## First call default panel function
      panel.lmline(x, y, col = 2) ## Overlay a simple linear regression line
})

library(ggplot2)
str(mpg)

qplot(displ,hwy,data=mpg,geom=c("point","smooth"))

#Histograms
qplot(hwy,data=mpg,fill=drv)

#Facets
qplot(displ,hwy,data=mpg,facets=.~drv)

qplot(hwy,data=mpg,facets=drv~.,binwidth=2)


testdat<-data.frame(x=1:100,y=rnorm(100))
testdat[50,2]<-100
plot(testdat$x,testdat$y,type="l",ylim=c(-3,3))

g<-ggplot(testdat,aes(x=x,y=y))

g+geom_line()
g+geom_line()+ylim(-3,3)
g+geom_line()+coord_cartesian(ylim=c(-3,3))


## Calculate the deciles of the data!
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 11), na.rm = TRUE)
## Cut the data at the deciles and create a new factor variable!
maacs$no2dec <- cut(maacs$logno2_new, cutpoints)
## See the levels of the newly created factor variable!
levels(maacs$no2dec)