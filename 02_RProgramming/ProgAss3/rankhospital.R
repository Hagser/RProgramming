rankhospital <- function(state, outcome, num = "best") {
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
  
  states<-outcomedata[outcomedata["State"]==state,]
  
  states[, column] <- as.numeric(states[, column])  
  
  if(nrow(states)==0)
  {
    stop("invalid state")
  }
  
  bado <- is.na(states[,column])
  
  states<-states[!bado,]
  
  if(num=="best")
  {
    minvalue<-min(states[,column],na.rm = TRUE)
    states<-states[states[column]==minvalue,2]
    return(states)
  }  
  else if(num=="worst")
  {
    maxvalue<-max(states[,column],na.rm = TRUE)
    states<-states[states[column]==maxvalue,2]
    return(states)
  }
  else if(is.numeric(as.numeric(num)))
  {
    num<-as.numeric(num)
    if(nrow(states)<num)
    {
      return(NA)
    }
    ordered<-sort(states[,column],decreasing = FALSE,na.last = FALSE)
    
    val<-ordered[[num]]
    limited<-states[states[column]==val,]
    
    return(limited[,2])
    
#     rank<-data.frame(Hospital.name=NULL,Rate=NULL,Rank=NULL)
#     irank<-0
#     for(i in seq(1,num))
#     {
#       val<-ordered[[i]]
#       limited<-states[states[column]==val,]
#       
#       for(r in seq(1,nrow(limited)))
#       {
#         if(nrow(rank)==0||nrow(rank[rank[1]==limited[[r,2]],])==0)
#         {
#           irank<-irank+1
#           nrank<-data.frame(Hospital.name=limited[[r,2]],Rate=limited[[r,column]],Rank=irank)
#           rank<-rbind(rank,nrank)
#         }
#       }      
#     }
#     return(rank)
  }
}