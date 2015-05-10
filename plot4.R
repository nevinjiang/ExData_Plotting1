## Coursera Data Science ##
# Exploratory Data Analysis #
# week 1 Plot 4

# read in data 
dt <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)[-c(1:66600, 69600:2075260), ]
dt <- rbind(dt[dt$Date == "1/2/2007", ], dt[dt$Date == "2/2/2007",])

# convert and add Date-time column
Date_time <- paste(as.Date(dt$Date, format = "%d/%m/%Y"), dt$Time, sep = " ")
dt <- cbind(Date_time, dt)
dt$Date_time <- strptime(dt$Date_time, format = "%Y-%m-%d %H:%M:%S")

### plot 4 ###
par(mfrow = c(2, 2))
# plot global active power figure (topleft)
plot(dt$Date_time, dt$Global_active_power, xlab = "Time", ylab = "Global Active power", type = "n")
lines(dt$Date_time, dt$Global_active_power)

# plot Voltage figure (topright)
plot(dt$Date_time, dt$Voltage, xlab = "Time", ylab = "Voltage", type = "n")
lines(dt$Date_time, dt$Voltage)

# plot Energy sub metering figure (bottomleft)
with(dt, plot(dt$Date_time, dt$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"), 
     plot(dt$Date_time, dt$Sub_metering_2, type = "n"),
     plot(dt$Date_time, dt$Sub_metering_3, type = "n"))
lines(dt$Date_time, dt$Sub_metering_1, col = "black")
lines(dt$Date_time, dt$Sub_metering_2, col = "red")
lines(dt$Date_time, dt$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), 
       col = c("black", "red", "blue"))

# plot global reactive power figure (bottomright)
plot(dt$Date_time, dt$Global_reactive_power, xlab = "Time", ylab = "Global Reactive Power", type = "n")
lines(dt$Date_time, dt$Global_reactive_power)

# output figure
dev.copy(png, "week1_plot_4.png")
dev.off()
