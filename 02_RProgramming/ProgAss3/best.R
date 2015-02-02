#Programming Assignment 3


best <- function(state, outcome) {
  
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
  
  minvalue<-min(states[,column],na.rm = TRUE)
  

  states<-states[states[column]==minvalue,2]
  
  states
  
}

