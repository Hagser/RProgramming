corr <- function(directory, threshold = 0) {
  
  cor.results = vector("numeric")
  
  for(fn in list.files(directory,full.names = TRUE))
  {
    dat<-read.csv(fn)
    dat<-dat[complete.cases(dat),]
    
    if(nrow(dat)>threshold)
    {
      cor.results <- c(cor.results,cor(dat[,"sulfate"],dat[,"nitrate"],use="complete.obs"))
    }
  }
  cor.results

  
  
}