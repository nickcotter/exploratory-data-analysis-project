NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle_scc <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case=TRUE),]

baltimore <- subset(NEI, fips == "24510")
baltimore_vehicle <- merge(baltimore, vehicle_scc, by="SCC")

baltimore_vehicle$vehicletype <- baltimore_vehicle$EI.Sector
levels(baltimore_vehicle$vehicletype) <- gsub("Mobile - On-Road ", "", levels(baltimore_vehicle$vehicletype))

ggplot(baltimore_vehicle, aes(factor(year), Emissions)) + geom_col() + facet_wrap( ~ vehicletype, scales = 'free') + labs(x="Year", y = "Emissions (tons)")


# TODO
# plot title
# png output