library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreNEI <- NEI[NEI$fips=="24510",]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)

png("plot3.png", width=640, height=480)
ggp <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
ggp <- ggp + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City from 1999 to 2008')

print(ggp)
dev.off()
