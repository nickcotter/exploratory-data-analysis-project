NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc <- SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE),]
coal_comb_scc <- coal_scc[grep("comb", coal_scc$EI.Sector, ignore.case=TRUE),]

nei_coal_comb <- merge(NEI, coal_comb_scc, by="SCC")

total_cc_by_year <- aggregate(nei_coal_comb$Emissions, by=list(year=nei_coal_comb$year), sum)

barplot(total_cc_by_year$x/1000, names.arg=total_cc_by_year$year, xlab="Year", ylab="Total Emissions (Kilotons)")

# TODO
# plot title
# png output