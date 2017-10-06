NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips=="24510")

baltimore_total_by_year <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), sum)

plot(baltimore_total_by_year$year, baltimore_total_by_year$x, xlab = "Year", ylab = "Total Emissions (Tons)", pch=16)
abline(lm(baltimore_total_by_year$x~baltimore_total_by_year$year))

# TODO
# png output