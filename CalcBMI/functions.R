convertw<-function(weight,wtype=""){
      wval<-weight
      if(wtype=="Lbs")
      {
            wval<-(weight*0.45359237)
      }
      return(wval)      
}
converth<-function(height,htype=""){
      hval<-height
      if(htype=="Feet")
      {
            hval<-(height*30.48)
      }
      if(htype=="Inches")
      {
            hval<-(height*2.54)
      }
      return(hval)
}
converttow<-function(weight,wtype=""){
      wval<-weight
      if(wtype=="Lbs")
      {
            wval<-(weight*2.204622621848)
      }
      return(wval)      
}
converttoh<-function(height,htype=""){
      hval<-height
      if(htype=="Feet")
      {
            hval<-(height/30.48)
      }
      if(htype=="Inches")
      {
            hval<-(height*0.39370078740157)
      }
      return(hval)
}
calc<-function(weight,height,wtype="",htype=""){
      wval<-convertw(weight,wtype)
      hval<-converth(height,htype)
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