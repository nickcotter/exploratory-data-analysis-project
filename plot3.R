require(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510")

# column plot
baltimore_total_by_year <- aggregate(baltimore$Emissions, by = list(year = baltimore$year), sum)
ggplot(baltimore, aes(factor(year), Emissions)) + geom_col() + facet_wrap( ~ type, nrow=2, scales = 'free') + labs(x="Year", y = "Emissions (tons)")

# TODO
# plot title
# png output