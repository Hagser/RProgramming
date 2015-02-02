complete <- function(directory, id = 1:332) {
  
  
  dat<-data.frame(id=NA,nobs=NA)
  
  for(i in id)
  {
    fn<-paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = "")
    
    x<-read.csv(fn)
    #print(nrow(x))
    x<-x[complete.cases(x),]
    #print(nrow(x))
    ndat<-c(i,nrow(x))
    dat<-rbind(dat,ndat)
    
  }
  
  dat[complete.cases(dat),]
  
}