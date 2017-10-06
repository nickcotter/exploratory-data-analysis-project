NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_scc <- SCC[grep("coal", SCC$Short.Name, ignore.case=TRUE),]
coal_comb_scc <- coal_scc[grep("comb", coal_scc$Short.Name, ignore.case=TRUE),]

nei_coal_comb <- merge(NEI, coal_comb_scc, by="SCC")

total_cc_by_year <- aggregate(nei_coal_comb$Emissions, by=list(year=nei_coal_comb$year), sum)

plot(total_cc_by_year$year, total_cc_by_year$x/1000, xlab = "Year", ylab = "Total Emissions (Kilotons)", axes=FALSE)
axis(1)
pts <- pretty(total_cc_by_year$x/1000)
axis(2, at=pts, labels=pts)
box()

# TODO
# verify numbers
# column instead of points
# png output