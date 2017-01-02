# Course name: Exploratory Data Analysis
# Candidate Name: Balasubramaniam AV
# Topic : Peer-graded Assignment: Course Project 1
# Date: 01 Jan 2017

# Set the directory for reading the input data from Local directory


HHP_file <- file('d:/household_power_consumption.txt')
HHP_Data <- read.table(HHP_file, header=T, sep=";", na.strings="?")
HHP_full_Data <- HHP_Data[HHP_Data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(HHP_full_Data$Date, HHP_full_Data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
HHP_full_Data <- cbind(SetTime, HHP_full_Data)

# Opening a png file to capture the result 
png(filename='d:/plot4.png')

# Generating
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(HHP_full_Data$SetTime, HHP_full_Data$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(HHP_full_Data$SetTime, HHP_full_Data$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(HHP_full_Data$SetTime, HHP_full_Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(HHP_full_Data$SetTime, HHP_full_Data$Sub_metering_2, type="l", col="red")
lines(HHP_full_Data$SetTime, HHP_full_Data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(HHP_full_Data$SetTime, HHP_full_Data$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")



#switching off the device post creation of the graphn in png.
dev.off()