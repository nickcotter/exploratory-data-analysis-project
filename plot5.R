NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle_scc <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case=TRUE),]

baltimore <- subset(NEI, fips == "24510")
baltimore_vehicle <- merge(baltimore, vehicle_scc, by="SCC")

total_vehicle_by_year <- aggregate(baltimore_vehicle$Emissions, by=list(year=baltimore_vehicle$year), sum)

barplot(total_vehicle_by_year$x, names.arg=total_vehicle_by_year$year, xlab="Year", ylab="Total Emissions (Tons)")

# TODO
# show changes in vehicle type instead of simple total
# plot title
# png output