rankall <- function(outcome, num = "best") {
  outcomedata <- read.csv("C:\\Users\\jh\\Documents\\ProgAss3\\outcome-of-care-measures.csv", colClasses = "character")
  outcome<-tolower(outcome)
  column<-0
  if(tolower(outcome)=="heart attack")
  {
    outcome<-"Heart Attack"
    column<-11
  }
  else if(tolower(outcome)=="heart failure")
  {
    outcome<-"Heart Failure"
    column<-17
  }
  else if(tolower(outcome)=="pneumonia")
  {
    outcome<-"Pneumonia"
    column<-23
  }
  else
  {
    stop("invalid outcome")
  }
  
  outcomedata[, column] <- as.numeric(outcomedata[, column])
  
  states<-outcomedata
  
  
  states[, column] <- as.numeric(states[, column]) 
  states[, 7] <- as.character(states[, 7])
  
  bado <- is.na(states[,column])
  
  states<-states[!bado,]
  
  names(states)[2] <-"hospital"
  names(states)[7] <-"state"
  
  allstates<-sort(unique(states[,7],MARGIN = 1))
  #allstates=c("NV")
  rank<-data.frame(hospital=NULL,state=NULL)
  if(num=="best")
  {
    for(st in allstates)
    {
      minvalue<-min(states[states[7]==st,column],na.rm = TRUE)
      nrank<-states[states[column]==minvalue,c(2,7)]
      nrank<-nrank[nrank[2]==st,]
      rank<-rbind(rank,nrank)
    }
    return(rank)
  }  
  else if(num=="worst")
  {
    for(st in allstates)
    {
      maxvalue<-max(states[states[7]==st,column],na.rm = TRUE)
      nrank<-states[states[column]==maxvalue,c(2,7)]
      nrank<-nrank[nrank[2]==st,]
      rank<-rbind(rank,nrank)
    }
    return(rank)
  }
  else if(is.numeric(as.numeric(num)))
  {
    num<-as.numeric(num)
    
    for(st in allstates)
    {      
      nrank<-states[states[7]==st,c(2,7,column)]
      #View(nrank)
      snrank<-sort(nrank[,3],decreasing=FALSE,na.last=FALSE)
      #snrank<-unique(snrank,MARGIN = 1)
      #View(snrank)
      
      if(length(snrank)<num)
      {
        rank<-rbind(rank,data.frame(hospital=NA,state=st))
      }
      else
      {
        vrank<-nrank[nrank[3]==snrank[num],c(1,2)]
        #View(vrank)
        if(nrow(vrank)==1)
        {
          rank<-rbind(rank,vrank)
        }
        else
        {
          svrank=sort(vrank[,1],decreasing = FALSE)
          rank<-rbind(rank,data.frame(hospital=svrank[1],state=st))
          
        }
      }
      
    }
    return(rank)
    
}
}