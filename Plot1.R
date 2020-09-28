### setting working directory
setwd("C:/Users/kjonathan/Desktop")
### Reading data
powercons<-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")
powercons
### changing classes
powercons$Date <- as.Date(powercons$Date, format="%d/%m/%Y")
powercons$Time <- format(powercons$Time, format="%H:%M:%S")
powercons$Global_active_power <- as.numeric(powercons$Global_active_power)
powercons$Global_reactive_power <- as.numeric(powercons$Global_reactive_power)
powercons$Voltage <- as.numeric(powercons$Voltage)
powercons$Global_intensity <- as.numeric(powercons$Global_intensity)
powercons$Sub_metering_1 <- as.numeric(powercons$Sub_metering_1)
powercons$Sub_metering_2 <- as.numeric(powercons$Sub_metering_2)
powercons$Sub_metering_3 <- as.numeric(powercons$Sub_metering_3)

### sub-setting
subsetpower<-subset(powercons, Date == "2007-02-01"|Date =="2007-02-02")

### Plotting
png("plot1.png", width = 480, height = 480)
hist(subsetpower$Global_active_power, col = "red", border = "black", main = "Global active power",xlab = "Global active power(kilowatts)", ylab="Frequency")
