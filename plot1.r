NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
yearlyTotal<-aggregate(NEI$Emissions,by=list(Year=NEI$year),sum)
yearlyTotal$y <- round(yearlyTotal$x/1000,2)
barplot(yearlyTotal$y, xlab="Year", ylab=expression(paste('PM',''[2.5],'in Kilotons')), main=expression(paste('Total Emission of PM'[2.5])),names.arg = yearlyTotal$Year)
