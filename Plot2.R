## Getting full dataset
raw_data <- read.table("household_power_consumption.txt"
                       , header=TRUE
                       , na.strings="?"
                       , sep=";")

head(raw_data)
nrow(raw_data)
summary(raw_data)
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(raw_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 2
plot(data$Datetime, data$Global_active_power
     , type = "l", xlab = ""
     , ylab = "Global Active Power (kilowatts)")

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

