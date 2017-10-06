NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips=="24510")

baltimore_total_by_year <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), sum)

barplot(baltimore_total_by_year$x, names.arg=baltimore_total_by_year$year, xlab="Year", ylab="Total Emissions (Tons)")

# TODO
# plot title
# png output