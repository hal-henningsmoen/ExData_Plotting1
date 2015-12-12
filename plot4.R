source('util.R')

hpc_data <- load_electrical_data("household_power_consumption.txt")

## Plot 4:  Four summary charts in one pane
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), bg = "transparent")
with(hpc_data, plot(datetime, Global_active_power, type = 'l', col="black", bg = "transparent", ylab = "Global Active Power (kilowatts)", xlab = "", main = NULL))
with(hpc_data, plot(datetime, Voltage, type = 'l', col="black", bg = "transparent", ylab = "Voltage", xlab = NULL, main = NULL))
with(hpc_data, plot(datetime, Sub_metering_1, type = 'l', col = 'black',  ylab = "Energy sub metering",xlab = "", main = NULL))
with(hpc_data, lines(datetime, Sub_metering_2, col = 'red'))
with(hpc_data, lines(datetime, Sub_metering_3, col = 'blue'))
legend("topright", bty="n", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(hpc_data, plot(datetime, Global_reactive_power, type = 'l', col="black", bg = "transparent", ylab = "Global_reactive_power", xlab = NULL, main = NULL))
dev.off()