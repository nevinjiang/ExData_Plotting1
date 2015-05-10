## Coursera Data Science ##
# Exploratory Data Analysis #
# week 1 Plot 2

# read in data 
dt <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)[-c(1:66600, 69600:2075260), ]
dt <- rbind(dt[dt$Date == "1/2/2007", ], dt[dt$Date == "2/2/2007",])

# convert and add Date-time column
Date_time <- paste(as.Date(dt$Date, format = "%d/%m/%Y"), dt$Time, sep = " ")
dt <- cbind(Date_time, dt)
dt$Date_time <- strptime(dt$Date_time, format = "%Y-%m-%d %H:%M:%S")

### plot 2 ###
par(mfrow = c(1, 1))
plot(dt$Date_time, dt$Global_active_power, xlab = "Time", ylab = "Global Active power", type = "n")
lines(dt$Date_time, dt$Global_active_power)
dev.copy(png, "week1_plot_2.png")
dev.off()
