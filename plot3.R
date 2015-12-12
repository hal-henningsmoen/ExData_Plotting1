source('util.R')

hpc_data <- load_electrical_data("household_power_consumption.txt")

## Plot histogram for energy sub metering
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(hpc_data, plot(datetime, Sub_metering_1, type = 'l', col = 'black',  ylab = "Energy sub metering",xlab = "", main = NULL))
with(hpc_data, lines(datetime, Sub_metering_2, col = 'red'))
with(hpc_data, lines(datetime, Sub_metering_3, col = 'blue'))
legend("topright",  lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(bg = "transparent")
dev.off()