## Plot 4

datajpa <- read.csv("./household_power_consumption.txt", sep=";", na.string="?")
datajpa$DateTime <- strptime(paste(datajpa$Date, datajpa$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

djpa <- datajpa[as.Date(datajpa$DateTime) >= as.Date("2007-02-01") & 
            as.Date(datajpa$DateTime) <= as.Date("2007-02-02"), ]

## Setting device size
png("plot4.png", width=480, height=480)

## The plot
par(mfrow = c(2,2))
with(djpa, {
  plot(DateTime, Global_active_power, type="l", 
       xlab="", ylab="Global Active Power")
  plot(DateTime, Voltage, type="l", 
       xlab="datetime", ylab="Voltage")
  plot(DateTime, Sub_metering_1, type="l", 
       xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", cex=0.7, bty="n", lty=c(1,1), col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l", 
       xlab="datetime", ylab="Global_reactive_Power")
})

dev.off()