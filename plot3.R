dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subMetering1 <- subSetData$Sub_metering_1
subMetering2 <- subSetData$Sub_metering_2
subMetering3 <- subSetData$Sub_metering_3
datetime <- strptime(paste(subSetData$Date,
                           subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename='figure/plot3.png',width=480,height=480,units='px')

plot(datetime, subMetering1,
     type='l', xlab='', ylab='Energy sub metering')
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend ("topright",
        legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=1, lwd=1, col=c("black", "red", "blue"))

x <- dev.off()
