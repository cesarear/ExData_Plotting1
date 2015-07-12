#variable that specifies the path to the data file
#Change this path if necessary
pathToDataFiles = './pwrCom'
pathToPlots     = './plotPrj1'

#**************************
#DO NOT CHANGE from HERE!!
#**************************
sourceData = paste(pathToDataFiles,"household_power_consumption.txt",sep="/")
full.ds <- read.csv(sourceData, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

# Convert date and time
full.ds$Time <- as.POSIXlt(paste(full.ds$Date, full.ds$Time),format="%d/%m/%Y %H:%M:%S")
full.ds$Date <- as.POSIXlt(full.ds$Date,format="%d/%m/%Y")

#as.POSIXlt year is based 1900, month is based 0 (zero-indexed))
prj1 <- subset(full.ds, Date$year == 107 & Date$mon == 1 & (Date$mday == 1 | Date$mday == 2) )


dstPlot = paste(pathToPlots,"plot2.png",sep="/")
# Open png device
png(filename=dstPlot, width = 480, height = 480)
plot(prj1$Time,prj1$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type='l')
dev.off