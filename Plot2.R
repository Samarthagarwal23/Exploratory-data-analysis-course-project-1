
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

# Creating plot using plot function and line type
plot( house_data1$Global_active_power ~ house_data1$Datetime , type="l" , ylab="Global Active Power (kilowatts)", xlab="")

# Copying to device as png file
dev.copy(png, file="plot2.png", height=480, width=480)

#Turning device off
dev.off()