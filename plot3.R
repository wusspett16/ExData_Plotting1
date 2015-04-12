# Get, clean and convert data
y <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
y$Date <- as.Date(y$Date, format = "%d/%m/%Y")

# subset data
data <- y[with(y, Date >= "2007-02-01" & Date <= "2007-02-02"),]

# convert subsetted data
data$Global_active_power <- as.numeric(data$Global_active_power)
datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

# plot data
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# save as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()