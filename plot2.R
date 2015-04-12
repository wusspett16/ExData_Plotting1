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
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# save as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()