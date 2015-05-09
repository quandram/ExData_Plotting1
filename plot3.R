thisData <- read.csv2("household_power_consumption.txt", na.strings="?", colClasses="character")
thisData$Date <- as.Date(thisData$Date, "%d/%m/%Y")

thisData2 <- subset(thisData, thisData$Date=="2007-02-01" | thisData$Date=="2007-02-02")
thisData2$DT <- as.POSIXct(paste(thisData2$Date, thisData2$Time), format="%Y-%m-%d %H:%M:%S")
thisData2$Global_active_power <- as.numeric(thisData2$Global_active_power)

png(filename="./plot3.png",width=480, height=480)

plot(thisData2$DT, thisData2$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(thisData2$DT,thisData2$Sub_metering_1)
lines(thisData2$DT,thisData2$Sub_metering_2, col="red")
lines(thisData2$DT,thisData2$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

dev.off()