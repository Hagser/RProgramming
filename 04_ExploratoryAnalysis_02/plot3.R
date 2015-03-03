#Course project 2
#Question
# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot to PNG
png("plot3.png", width=640, height=480)
#reset plot-row parameters
par(mfrow=c(1,1))
data<-NEI[complete.cases(NEI),]
data[,4]<-as.numeric(data[,4])
data[,"year"]<-as.numeric(data[,"year"])

data<-data[!is.na(data[,4]),]
data<-data[data["fips"]=="24510",]

types<-unique(data[,"type"])
years<-unique(data[,"year"])

sums<-seq(from=1,to=length(years)*length(types))

head(data[data["year"]==1999 && data["type"]=="POINT",4])
View(data)
i<-0
for(y in years)
{
      for(t in types)
      {
            sums[i]<-sum(data[data["year"]==as.numeric(y) && data["type"]==t,4])
            i<-i+1
      }
}

qplot(year,Emissions,data=data,facets=.~type)

#close device
dev.off()

