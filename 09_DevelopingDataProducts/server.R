library(shiny)
calc<-function(weight,height,wtype="",htype=""){
      wval<-weight
      hval<-height
      if(wtype=="Lbs")
      {
            wval<-(weight*0.45359237)
      }
      if(htype=="Feet")
      {
            hval<-(height*30.48)
      }
      if(htype=="Inches")
      {
            hval<-(height*2.54)
      }
      bmi<-(wval/(hval/100)^2)
      
      return(bmi)
}
describe<-function(bmi)
{
      df<-data.frame(Text=NULL,min=NULL,max=NULL)
      
      df<-rbind(df,data.frame(Text="Very severely underweight",min=0,max=15))
      df<-rbind(df,data.frame(Text="Severely underweight",min=15,max=16))
      df<-rbind(df,data.frame(Text="Underweight",min=16,max=18.5))
      df<-rbind(df,data.frame(Text="Normal (healthy weight)",min=18.5,max=25))
      df<-rbind(df,data.frame(Text="Overweight",min=25,max=30))
      df<-rbind(df,data.frame(Text="Obese Class I (Moderately obese)",min=30,max=35))
      df<-rbind(df,data.frame(Text="Obese Class II (Severely obese)",min=35,max=40))
      df<-rbind(df,data.frame(Text="Obese Class III (Very severely obese)",min=40,max=Inf))
      df[,"min"]<-as.numeric(df[,"min"])
      df[,"max"]<-as.numeric(df[,"max"])
     
      ret<-subset(x = df,df[,"min"]<bmi)
      ret<-subset(x = ret,ret[,"max"]>=bmi)
      txt<-as.character(ret[,1])
      return(txt)
}
shinyServer(
      
      function(input,output)
      {
            output$bmi<-renderPrint({calc(input$weight,input$height,input$wtype,input$htype)})
            output$bmidescription<-renderPrint({describe(calc(input$weight,input$height,input$wtype,input$htype))})
            output$plot<-renderPlot({
                  groups<-c(0,15,16,18.5,25,30,35,40,Inf)
                  plot(input$weight,input$height,xlim=c(30,200),ylim=c(90,220),pch=21)
                  
                  dafr <- data.frame(w=NULL,h=NULL,calc=NULL)
                  for(we in c(30:200))
                        for(he in c(90:220))
                        {
                              ca<-calc(we,he)
                              
                              if(any(groups==ca))
                              {
                                    #dafr<-rbind(dafr,data.frame(w=we,h=he,calc=ca))
                                    abline(we,he)
                                    
                              }
                        }
                  
                  
            })
      }
)