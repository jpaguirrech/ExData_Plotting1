## Plot 2 

dataFile <- "./household_power_consumption.txt"
datajpa <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- datajpa[datajpa$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAP <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
