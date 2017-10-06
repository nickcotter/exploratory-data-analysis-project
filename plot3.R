require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips=="24510")

baltimore_total_by_year <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), sum)

ggplot(baltimore, aes(year, Emissions)) + geom_col() + facet_grid(~ type)