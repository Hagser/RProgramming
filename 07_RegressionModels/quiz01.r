#quiz
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
w*(x-1.077)^2
      

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

plot(x,y,pch=19)
      lm(I(x-mean(x))~I(y-mean(y))-1)


data(mtcars)

mpg<-mtcars$mpg-mean(mtcars$mpg)
weight<-mtcars$wt-mean(mtcars$wt)
lm(I(mpg)~I(weight)-1)


x <- c(8.58, 10.46, 9.01, 9.64, 8.86)


x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(I(x-mean(x))~I(y-mean(y))-1)



x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

min(x)