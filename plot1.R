thisData <- read.csv2("household_power_consumption.txt", na.strings="?", colClasses="character")
thisData$Date <- as.Date(thisData$Date, "%d/%m/%Y")

thisData2 <- subset(thisData, thisData$Date=="2007-02-01" | thisData$Date=="2007-02-02")
thisData2$DT <- as.POSIXct(paste(thisData2$Date, thisData2$Time), format="%Y-%m-%d %H:%M:%S")
thisData2$Global_active_power <- as.numeric(thisData2$Global_active_power)

png(filename="./plot1.png",width=480, height=480)

hist(thisData2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()