NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, fips=="24510")

baltimore_total_by_year <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), sum)

png(filename = "plot2.png")
barplot(baltimore_total_by_year$x, names.arg=baltimore_total_by_year$year, xlab="Year", ylab="Total Emissions (Tons)")
title("Total PM2.5 emissions : Baltimore City, MD")
dev.off()