## Coursera Data Science ##
# Exploratory Data Analysis #
# week 1 Plot 1

# read in data 
dt <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)[-c(1:66600, 69600:2075260), ]
dt <- rbind(dt[dt$Date == "1/2/2007", ], dt[dt$Date == "2/2/2007",])

# convert and add Date-time column
Date_time <- paste(as.Date(dt$Date, format = "%d/%m/%Y"), dt$Time, sep = " ")
dt <- cbind(Date_time, dt)
dt$Date_time <- strptime(dt$Date_time, format = "%Y-%m-%d %H:%M:%S")

# plot figure 1
par(mfrow = c(1, 1))
dt$Global_active_power <- as.numeric(dt$Global_active_power)
hist(dt$Global_active_power, breaks = 12, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, "week1_plot_1.png")
dev.off()
