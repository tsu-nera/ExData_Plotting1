dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";",
                   stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
png(filename='figure/plot1.png',width=480,height=480,units='px')

globalActivePower <- as.numeric(subSetData$Global_active_power)
hist(globalActivePower,
     xlab='Global Active Power (kilowatts)', col='red')
x<-dev.off()
