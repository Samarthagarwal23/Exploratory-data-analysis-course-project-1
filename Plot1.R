
#Reading the data
house_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F)

# Subsetting for specified dates
house_data1 <- subset(house_data, Date == "1/2/2007" | Date == "2/2/2007")

#Changing date format and remove main data to save space
house_data1$Date <- as.Date(house_data1$Date, format="%d/%m/%Y")
rm(house_data)

#Creating plot using histogram
hist(house_data1$Global_active_power, col = "red", main = "Global active power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Copying to device as png file
dev.copy(png, file="plot1.png", height=480, width=480)

#Turning device off
dev.off()
