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


## Generating Plot 3
plot(data$Datetime, data$Sub_metering_1, type = "l"
     , xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l"
       , xlab = "", ylab = "Energy sub metering", col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l"
       , xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## export file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

