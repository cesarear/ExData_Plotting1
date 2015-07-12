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


dstPlot = paste(pathToPlots,"plot4.png",sep="/")
# Open png device
png(filename=dstPlot, width = 480, height = 480)

#Split dev
par(mfrow=c(2,2))
#Upper Left Corner
plot(prj1$Time,prj1$Global_active_power, xlab='', ylab='Global Active Power', type='l')
#Upper Right Corner
plot(prj1$Time, prj1$Voltage, xlab='datetime', ylab='Voltage', type='l')
#lower left corner
plot(prj1$Time,prj1$Sub_metering_1, xlab='', ylab='Energy sub metering', type='l')
lines(prj1$Time, prj1$Sub_metering_2, col='red')
lines(prj1$Time, prj1$Sub_metering_3, col='blue')
legend('topright',legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid', bg="transparent", bty="n")
#lower rigth coner
plot(prj1$Time, prj1$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off