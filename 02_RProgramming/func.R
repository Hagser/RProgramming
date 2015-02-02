getgood<-function(csv)
{
  x<-read.csv(csv)
  good <- complete.cases(x)
  x[good,]
}
add2<-function(x,y)
{
  x+y
}
above<-function(x,n)
{
  use<-x>n
  x[use]
}