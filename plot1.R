setwd("C:/Users/Taylor/OneDrive/Documents/Exploratory Data Analysis Week 1")

#Read and name power consumption data
household_power_consumption <- read.table("C:/Users/Taylor/OneDrive/Documents/Exploratory Data Analysis Week 1/household_power_consumption.txt", header=FALSE, sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subset power consumption data for dates 1 Feb 2007 and 2 Feb 2007
power_sub <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007")

#Generate PNG file
png("plot1.png", width = 480, height = 480)

#Call histogram
hist(as.numeric(as.character(power_sub$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Close graphics
dev.off()