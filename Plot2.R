setwd("C:/Users/User/Desktop/Coursera/Exploratorydataanalysis/")

datafile <- file.path(getwd(), "household_power_consumption.txt")
data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dt <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(datasub$Global_active_power)

png("plot2.png")
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()