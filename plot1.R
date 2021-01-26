## Plot 1 Histogram

dataFile <- "./household_power_consumption.txt"
datajpa <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- datajpa[datajpa$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
glbalPA <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()