## Exploratory Data Analysis ##
## Course Project 1 Plot 4 ##

# Dataset: Electric power consumption [20Mb] from UC Irvine Machine Learning Repository 
# (http://archive.ics.uci.edu/ml/)
# Description: Measurements of electric power consumption in one household with a 
# one-minute sampling rate over a period of almost 4 years. Different electrical 
# quantities and some sub-metering values are available.
#
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, 
# containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry 
# room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric 
# water-heater and an air-conditioner.

# Plot4: Energy sub metering vs. Days

# Load the data data from the dates 2007-02-01 and 2007-02-02
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
powerData <- read.csv(dataFile, header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "")
subsetPowerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

# Assign variables to "Date", "Global_active_power", "Global_reactive_power", "Voltage", "Sub_metering_1", 
# "Sub_metering_2" and "Sub_metering_3"
dateTime <- strptime(paste(subsetPowerData$Date, subsetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetPowerData$Global_active_power)
globalReactivePower <- as.numeric(subsetPowerData$Global_reactive_power)
voltage <- as.numeric(subsetPowerData$Voltage)
subMetering1Data <- as.numeric(subsetPowerData$Sub_metering_1)
subMetering2Data <- as.numeric(subsetPowerData$Sub_metering_2)
subMetering3Data <- as.numeric(subsetPowerData$Sub_metering_3)

# Plot with 2 x 2 axes
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

# Plot (1,1)
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
# Plot (1,2)
plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Plot (2,1)
plot(dateTime, subMetering1Data, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dateTime, subMetering2Data, type = "l", col = "red")
lines(dateTime, subMetering3Data, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, 
       col = c("black", "red", "blue"), bty = "o")
# Plot (2,2) 
plot(dateTime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()