#debug server
      source(file = "functions.R")
      heig<-6
      weig<-150
      wtype<-"Lbs"
      htype<-"Feet"
      groups<-c(0,15,16,18.5,25,30,35,40,Inf)
      plot(weig,heig,xlab=paste("Weight (",wtype,")",sep=""),ylab=paste("Height (",htype,")",sep=""),main="You are the dot!",
           xlim=c(converttow(30,wtype),converttow(200,wtype)),
           ylim=c(converttoh(90,htype),converttoh(220,htype)),type="n")
      
      dafr <- data.frame(w=NULL,h=NULL,calc=NULL)
      for(we in seq(from = 30, to = 200, by = 3))
      {
            for(he in seq(from = 90, to = 220, by = 3))
            {
                  ca<-calc(we,he)
                  
                  if((ca<=70 && ca>0) | any(groups==ca))
                  {
                        
                        dafr<-rbind(dafr,data.frame(w=converttow(we,wtype),h=converttoh(he,htype),calc=ca))
                  }
            }
      }
      
      linwid<-8
      s1<-dafr[dafr$calc>groups[1] & dafr$calc<groups[2],]      
      lines(s1$w,s1$h,type="l", col="red",lwd = linwid)
      s1<-dafr[dafr$calc>groups[2] & dafr$calc<groups[4],]      
      lines(s1$w,s1$h,type="l", col="yellow",lwd = linwid)
      s1<-dafr[dafr$calc>groups[4] & dafr$calc<groups[5],]      
      lines(s1$w,s1$h,type="l", col="green",lwd = linwid)
      s1<-dafr[dafr$calc>groups[5] & dafr$calc<groups[7],]      
      lines(s1$w,s1$h,type="l", col="yellow",lwd = linwid)
      s1<-dafr[dafr$calc>groups[7],]      
      lines(s1$w,s1$h,type="l", col="red",lwd = linwid)
      
      points(weig,heig,pch=19,lwd = 3,col="blue")
      abline(h = heig)
      abline(v = weig)
