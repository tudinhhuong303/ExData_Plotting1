data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power <- as.numeric(filteredData$Global_active_power)
reactive_power <- as.numeric(filteredData$Global_reactive_power)
voltage <- as.numeric(filteredData$Voltage)
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()