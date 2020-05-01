setwd("C:/Users/Taylor/OneDrive/Documents/Exploratory Data Analysis Week 1")

#Read and name power consumption data
household_power_consumption <- read.table("C:/Users/Taylor/OneDrive/Documents/Exploratory Data Analysis Week 1/household_power_consumption.txt", header=FALSE, sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset power consumption data for dates 1 Feb 2007 and 2 Feb 2007
power_sub <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")

#Create POSIXct date
as.data.table(power_sub)[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Generate PNG file
png("plot2.png", width = 480, height = 480)

#Call plot
plot(power_sub$Time,as.numeric(as.character(power_sub$Global_active_power)),
     type = "1", xlab = "", ylab = "Global Active Power (kilowatts)")

#Close graphics
dev.off()