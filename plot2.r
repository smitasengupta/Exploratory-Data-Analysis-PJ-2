NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subNEI <- subset(NEI,fips=="24510",select=c(Emissions,year))
yearlyTotal<-aggregate(subNEI$Emissions,by=list(Year=subNEI$year),sum)
yearlyTotal$y <- round(yearlyTotal$x/1000,2)
barplot(yearlyTotal$y, xlab="Year", ylab=expression(paste('PM', ''[2.5], ' in Kilotons')), main=expression(paste('Total Emission ', ' (Baltimore City, MD)')), names.arg = yearlyTotal$Year , border="white", col=rainbow(5),  density=c(200))