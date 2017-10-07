require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510")

baltimore_total_by_year <- aggregate(baltimore$Emissions, by = list(year = baltimore$year), sum)

png(filename = "plot3.png")
p <- ggplot(baltimore, aes(factor(year), Emissions)) +
        geom_col() +
        facet_wrap( ~ type, nrow=2, scales = 'free') +
        labs(x="Year", y = "Emissions (tons)") +
        ggtitle("Total PM2.5 emissions by point type : Baltimore City, MD") +
        theme(plot.title = element_text(size=10, hjust = 0.5, face="bold"))
print(p)
dev.off()
