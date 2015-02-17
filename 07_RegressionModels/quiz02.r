x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(x ~ y)
sum(resid(fit))
predict(fit)

coef(fit)
summary(fit)


fit2 <- lm(x ~ I(y - mean(y)))
coef(fit2)
summary(fit2)


data(mtcars)

fitmc <- lm((mtcars$wt)~(mtcars$mpg))

coef(fitmc)
summary(fitmc)$coef
sum(resid(fitmc))
predict(fitmc)
par(mfrow = c(2, 2))
plot(fitmc)

summary(lm(resid(fitmc)~predict(fitmc)))$coef
