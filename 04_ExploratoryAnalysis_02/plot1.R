#Course project 2
#Question
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 
#emission from all sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot to PNG
png("plot1.png", width=640, height=480)
#reset plot-row parameters
par(mfrow=c(1,1))
data<-NEI[complete.cases(NEI),]
data[,4]<-as.numeric(data[,4])
data[,"year"]<-as.numeric(data[,"year"])

data<-data[!is.na(data[,4]),]

years<-unique(data[,"year"])

sums<-seq(from=1,to=length(years))

for(y in sums)
{
      sums[y]<-sum(data[data["year"]==years[y],4])
}


plot(years,sums)

#close device
dev.off()
