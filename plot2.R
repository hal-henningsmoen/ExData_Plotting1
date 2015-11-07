source('util.R')
hpc_data <- load_electrical_data("household_power_consumption.txt")

## Plot for global active power levels
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(hpc_data, plot(datetime, Global_active_power, type = 'l', col="black", bg = "transparent", ylab = "Global Active Power (kilowatts)", xlab = "", main = NULL))
dev.off()