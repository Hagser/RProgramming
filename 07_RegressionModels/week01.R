#week01
library(UsingR); data(galton)
library(manipulate)

step1<-function()
{
      par(mfrow=c(1,2))
      hist(galton$child,col="blue",breaks=100)
      hist(galton$parent,col="blue",breaks=100)
}

step2<-function()
{
      par(mfrow=c(1,1))
      myHist <- function(mu){
            hist(galton$child,col="blue",breaks=100)
            lines(c(mu, mu), c(0, 150),col="red",lwd=5)
            mse <- mean((galton$child - mu)^2)
            text(63, 150, paste("mu = ", mu))
            text(63, 140, paste("MSE = ", round(mse, 2)))
      }
      manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))
}

step3<-function()
{
      hist(galton$child,col="blue",breaks=100)
      meanChild <- mean(galton$child)
      lines(rep(meanChild,100),seq(0,150,length=100),col="red",lwd=5)
}

step4<-function()
{
      plot(galton$parent,galton$child,pch=19,col="blue")
}

step5<-function()
{
      freqData <- as.data.frame(table(galton$child, galton$parent))
      names(freqData) <- c("child", "parent", "freq")
      plot(as.numeric(as.vector(freqData$parent)), 
           as.numeric(as.vector(freqData$child)),
           pch = 21, col = "black", bg = "lightblue",
           cex = .15 * freqData$freq, 
           xlab = "parent", ylab = "child")
}

step6<-function()
{
      myPlot <- function(beta){
            y <- galton$child - mean(galton$child)
            x <- galton$parent - mean(galton$parent)
            freqData <- as.data.frame(table(x, y))
            names(freqData) <- c("child", "parent", "freq")
            plot(
                  as.numeric(as.vector(freqData$parent)), 
                  as.numeric(as.vector(freqData$child)),
                  pch = 21, col = "black", bg = "lightblue",
                  cex = .15 * freqData$freq, 
                  xlab = "parent", 
                  ylab = "child"
            )
            abline(0, beta, lwd = 3)
            points(0, 0, cex = 2, pch = 19)
            mse <- mean( (y - beta * x)^2 )
            title(paste("beta = ", beta, "mse = ", round(mse, 3)))
      }
      manipulate(myPlot(beta), beta = slider(0.6, 1.2, step = 0.02))
}

step7<-function()
{
      lm(I(child - mean(child))~ I(parent - mean(parent)) - 1, data = galton)
}
step8<-function()
{
      freqData <- as.data.frame(table(galton$child, galton$parent))
      names(freqData) <- c("child", "parent", "freq")
      plot(as.numeric(as.vector(freqData$parent)), 
           as.numeric(as.vector(freqData$child)),
           pch = 21, col = "black", bg = "lightblue",
           cex = .05 * freqData$freq, 
           xlab = "parent", ylab = "child")
      lm1 <- lm(galton$child ~ galton$parent)
      lines(galton$parent,lm1$fitted,col="red",lwd=3)
}

