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
png(filename='d:/plot2.png')

# Using the plot statement to plot the graph for the requested data
plot(HHP_full_Data$SetTime, HHP_full_Data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
#switching off the device post creation of the graphn in png.
dev.off()