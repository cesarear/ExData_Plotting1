#variable that specifies the path to the data file
#Change this path if necessary
pathToDataFiles = './pwrCom'
pathToPlots     = './plotPrj1'

#**************************
#DO NOT CHANGE from HERE!!
#**************************
sourceData = paste(pathToDataFiles,"household_power_consumption.txt",sep="/")
full.ds <- read.csv(sourceData, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

# Convert dates
full.ds$Date <- as.POSIXlt(full.ds$Date,format="%d/%m/%Y")

#as.POSIXlt year is based 1900, month is based 0 (zero-indexed))
prj1 <- subset(full.ds, Date$year == 107 & Date$mon == 1 & (Date$mday == 1 | Date$mday == 2) )


dstPlot = paste(pathToPlots,"plot1.png",sep="/")
# Open png device
png(filename=dstPlot, width = 480, height = 480)
hist(prj1$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off