NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
if(!exists("NEISCC")){  NEISCC <- merge(NEI, SCC, by="SCC")}
library(ggplot2)
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
TotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
TotalByYearAndFips$fips[TotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
TotalByYearAndFips$fips[TotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"
g <- ggplot(TotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity", fill="darkblue")  +  xlab("year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +  ggtitle('Total Emissions from motor vehicle (Baltimore City, MD vs Los Angeles, CA)')
print(g)
