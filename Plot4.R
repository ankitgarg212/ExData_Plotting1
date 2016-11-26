setwd("C:/Users/User/Desktop/Coursera/Exploratorydataanalysis/")

datafile <- file.path(getwd(), "household_power_consumption.txt")
data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dt <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(datasub$Global_active_power)
sm1 <- as.numeric(datasub$Sub_metering_1)
sm2 <- as.numeric(datasub$Sub_metering_2)
sm3 <- as.numeric(datasub$Sub_metering_3)
grp <- as.numeric(datasub$Global_reactive_power)
voltage <- as.numeric(datasub$Voltage)

png("plot4.png")
par(mfrow = c(2,2))
plot(dt, gap, type = "l",xlab = "", ylab = "Global Active Power")
plot(dt, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt, sm1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(dt, sm2, type = "l", col = "red")
lines(dt, sm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub-metering_2", "Sub-metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
plot(dt, grp, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()