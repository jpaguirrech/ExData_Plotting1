## Plot 3

datajpa <- read.csv("./household_power_consumption.txt", sep=";", na.string="?")
datajpa$DateTime <- strptime(paste(datajpa$Date, datajpa$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

djpa <- datajpa[as.Date(datajpa$DateTime) >= as.Date("2007-02-01") & 
            as.Date(datajpa$DateTime) <= as.Date("2007-02-02"), ]

# Setting device size
png("plot3.png", width=480, height=480)

# the plot
plot(djpa$DateTime, djpa$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(djpa$DateTime, djpa$Sub_metering_2, col="red")
lines(djpa$DateTime, djpa$Sub_metering_3, col="blue")
legend("topright", cex=0.8, lty=c(1,1), col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
