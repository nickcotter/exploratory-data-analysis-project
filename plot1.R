NEI <- readRDS("summarySCC_PM25.rds")

total_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), sum)

barplot(total_by_year$x/1000, names.arg=total_by_year$year, xlab="Year", ylab="Total Emissions (Kilotons)")
title("Total PM2.5 emissions : United States")

# TODO
# png output