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
png(filename='d:/plot3.png')

# Using the plot statement to plot the graph for the requested data
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(HHP_full_Data$SetTime, HHP_full_Data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(HHP_full_Data$SetTime, HHP_full_Data$Sub_metering_2, col=columnlines[2])
lines(HHP_full_Data$SetTime, HHP_full_Data$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
#switching off the device post creation of the graphn in png.
dev.off()