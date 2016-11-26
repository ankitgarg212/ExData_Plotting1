setwd("C:/Users/User/Desktop/Coursera/Exploratorydataanalysis/")

datafile <- file.path(getwd(), "household_power_consumption.txt")
data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
datasub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

gap <- as.numeric(datasub$Global_active_power)

png("plot1.png")
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

