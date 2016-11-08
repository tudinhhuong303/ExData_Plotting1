data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power <- as.numeric(filteredData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()