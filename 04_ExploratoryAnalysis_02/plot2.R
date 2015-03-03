#Course project 2
#Question

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot to PNG
png("plot2.png", width=640, height=480)
#reset plot-row parameters
par(mfrow=c(1,1))
data<-NEI[complete.cases(NEI),]
data[,4]<-as.numeric(data[,4])
data[,"year"]<-as.numeric(data[,"year"])

data<-data[!is.na(data[,4]),]
data<-data[data["fips"]=="24510",]
years<-unique(data[,"year"])

sums<-seq(from=1,to=length(years))

for(y in sums)
{
      sums[y]<-sum(data[data["year"]=years[y],4])
}

plot(years,sums)

#close device
dev.off()
