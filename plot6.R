NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle_scc <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case=TRUE),]

baltimore <- subset(NEI, fips == "24510")
baltimore_vehicle <- merge(baltimore, vehicle_scc, by="SCC")
total_baltimore_vehicle_by_year <- aggregate(baltimore_vehicle$Emissions, by=list(year=baltimore_vehicle$year), sum)

losangeles <- subset(NEI, fips == "06037")
losangeles_vehicle <- merge(losangeles, vehicle_scc, by="SCC")
total_losangeles_vehicle_by_year <- aggregate(losangeles_vehicle$Emissions, by=list(year=losangeles_vehicle$year), sum)

total_by_year <- data.frame(year=c(total_baltimore_vehicle_by_year$year, total_losangeles_vehicle_by_year$year), 
                            total=c(total_baltimore_vehicle_by_year$x, total_losangeles_vehicle_by_year$x),
                            city=as.factor(c(rep("Baltimore", 4), rep("Los Angeles County", 4))))

png(filename = "plot6.png")
p <- ggplot(total_by_year, aes(factor(year), total)) +
        geom_col() +
        facet_wrap( ~ city, scales = 'free') +
        labs(x="Year", y = "Emissions (tons)") +
        ggtitle("Total PM2.5 emissions by motor vehicle source", 
                subtitle="Baltimore City, MD vs Los Angeles County") +
        theme(plot.title = element_text(size=10, hjust = 0.5, face="bold"),
              plot.subtitle = element_text(size=10, hjust = 0.5, face="bold"))
print(p)
dev.off()