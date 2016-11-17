## Getting full dataset
raw_data <- read.csv("c:/data/household_power_consumption/household_power_consumption.txt"
                     , header = T, sep = ';'
                     , check.names = F
                     ,  stringsAsFactors = F, quote = '\"')
head(raw_data)
nrow(raw_data)
summary(raw_data)
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(raw_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)




## Generating Plot 4
par(mfrow = c(2, 2))

# plot 1 (NW)
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

# plot 2 (NE)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (SE)
plot(data$Datetime, data$Global_reactive_power, type = "l"
     , xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

## export file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

