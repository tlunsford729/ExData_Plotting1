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
png("plot4.png", width=480, height=480)

#Set up table arrangement
par(mfrow=c(2,2))

#Call Plot 1
plot(power_sub[, dateTime], power_sub[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

#Call Plot 2
plot(power_sub[, dateTime],power_sub[, Voltage], type="l", xlab="datetime", ylab="Voltage")

#Call Plot 3
plot(power_sub[, dateTime], power_sub[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power_sub[, dateTime], power_sub[, Sub_metering_2], col="red")
lines(power_sub[, dateTime], power_sub[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5)


#Call Plot 4
plot(power_sub[, dateTime], power_sub[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

#Close graphics
dev.off()