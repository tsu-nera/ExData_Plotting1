dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png(filename='figure/plot2.png',width=480,height=480,units='px')

globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date,
                           subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(datetime, globalActivePower,
     type='l', xlab='', ylab='Global Active Power (kilowatts)')

x<-dev.off()
