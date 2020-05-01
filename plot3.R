setwd("C:/Users/Taylor/OneDrive/Documents/Exploratory Data Analysis Week 1")

#Reads and subsets data
household_power_consumption <- data.table::fread(input = "household_power_consumption.txt"
         , na.strings="?")

#Prevent Scientific Notation
household_power_consumption[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Create POSIXct date
household_power_consumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Subset for 1 Feb 2007 & 2 Feb 2007
power_sub <- household_power_consumption[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Generate PNG file
png("plot3.png", width=480, height=480)

#Call plot
plot(power_sub[, dateTime], power_sub[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power_sub[, dateTime], power_sub[, Sub_metering_2],col="red")
lines(power_sub[, dateTime], power_sub[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#Close graphics
dev.off()