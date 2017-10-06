NEI <- readRDS("summarySCC_PM25.rds")

total_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), sum)

plot(total_by_year$year, total_by_year$x, xlab = "Year", ylab = "Total Emissions (Tons)", pch=16)
abline(lm(total_by_year$x~total_by_year$year))

# TODO
# png output