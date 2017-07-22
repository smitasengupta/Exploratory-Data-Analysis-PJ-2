NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
if(!exists("NEISCC")){  NEISCC <- merge(NEI, SCC, by="SCC")}
library(ggplot2)
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill="darkblue") +  xlab("year") +  ylab(expression('Total PM'[2.5]*" Emissions")) +  ggtitle('Total Emissions from coal sources')
print(g) 
