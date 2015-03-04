
#Reading the data
house_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F)

# Subsetting for specified dates
house_data1 <- subset(house_data, Date == "1/2/2007" | Date == "2/2/2007")

#Changing date format and remove main data to save space
house_data1$Date <- as.Date(house_data1$Date, format="%d/%m/%Y")
rm(house_data)

#Converting dates
datetime <- paste(as.Date(house_data1$Date), house_data1$Time)
house_data1$Datetime <- as.POSIXct(datetime)

#Creating plot
par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot( house_data1$Global_active_power ~ house_data1$Datetime , type="l" , ylab="Global Active Power (kilowatts)", xlab="")

plot(house_data1$Voltage~house_data1$Datetime, type="l", ylab="Voltage", xlab="")

with(house_data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(house_data1$Global_reactive_power~house_data1$Datetime, type="l", ylab="Voltage", xlab="")

# Copying to device as png file
dev.copy(png, file="plot4.png", height=480, width=480)

#Turning device off
dev.off()
