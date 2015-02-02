pollutantmean <- function(directory, pollutant, id = 1:332) {
  for(i in id)
  {
      fn<-paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = "")
      
      x<-read.csv(fn)
      #x<-x[complete.cases(x),]
      if(!is.data.frame(all))
      {
        all<-x
      }
      else if(nrow(x)>0)
      {
        all<-rbind(all,x)
      }
  }
   
  mean(all[,pollutant],na.rm=TRUE)

}