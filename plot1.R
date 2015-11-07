
source('util.R')
hpc_data <- load_electrical_data("household_power_consumption.txt")

## Plot histogram for global active power levels
png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(bg = "transparent")
with(hpc_data, hist(Global_active_power, breaks=12, col="red",  xlab = "Global Active Power (kilowatts)", main = 'Global Active Power'))
dev.off()