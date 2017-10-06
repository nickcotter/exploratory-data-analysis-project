NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

total_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), sum)


plot(total_by_year$year, total_by_year$x/1000, xlab = "Year", ylab = "Total Emissions (Kilotons)", axes=FALSE)
axis(1)
pts <- pretty(total_by_year$x/1000)
axis(2, at=pts, labels=pts)
box()

# TODO
# verify numbers
# column instead of points
# png output