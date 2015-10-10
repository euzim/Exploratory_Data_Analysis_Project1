## Exploratory Data Analysis ##
## Course Project 1 Plot 1 ##

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

# Plot1: Global Active Power 

# Load the data data from the dates 2007-02-01 and 2007-02-02
dataFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
powerData <- read.csv(dataFile, header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "")
subsetPowerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

# Assign variable to "Global_active_power"
globalActivePower <- as.numeric(subsetPowerData$Global_active_power)

# Plot
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()