NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
subsetNEI  <- NEI[NEI$fips=="24510", ]
yearlyTotal<-aggregate(subsetNEI$Emissions,by=list(Type=subsetNEI$type,Year=subsetNEI$year),sum)
g <- ggplot(yearlyTotal, aes(Year, x, color = Type))
g <- g + geom_line() +  xlab("year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +  ggtitle('Total Emissions in Baltimore City, MD')
print(g)
