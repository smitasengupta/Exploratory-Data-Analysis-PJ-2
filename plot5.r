NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
if(!exists("NEISCC")){  NEISCC <- merge(NEI, SCC, by="SCC")}
library(ggplot2)
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
TotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
g <- ggplot(TotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill="darkblue") +  xlab("year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +  ggtitle('Total Emissions from motor vehicle (Baltimore City, MD)')
print(g)
