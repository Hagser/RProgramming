library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)



library(datasets)
data(airquality)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)



library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)