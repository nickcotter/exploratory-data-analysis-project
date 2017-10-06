NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips=="24510")

baltimore_total_by_year <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), sum)


plot(baltimore_total_by_year$year, baltimore_total_by_year$x/1000, xlab = "Year", ylab = "Total Emissions (Kilotons)", axes=FALSE)
axis(1)
pts <- pretty(baltimore_total_by_year$x/1000)
axis(2, at=pts, labels=pts)
box()

# TODO
# verify numbers
# columns instead of points
# png output