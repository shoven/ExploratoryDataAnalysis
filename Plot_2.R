# Loads RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sample
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Subsets data and appends two years in one data frame
MD <- subset(NEI, fips == '24510')

png(filename = 'plot_2.png')
colors = c("green")
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]),col=colors)
#dev.off()