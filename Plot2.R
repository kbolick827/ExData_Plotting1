# Plot2
# uses data from the UC Irvine Machine Learning Repository found at http://archive.ics.uci.edu/ml/
# only data from 2007-02-01 and 2007-02-02 is used for the analysis
data <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637,nrows = 2880,na.strings= "?")
dt <-  colnames(read.table("household_power_consumption.txt", sep = ";",nrow = 1, header = TRUE)) 

# assigns column names
names(data) <- dt
str(data)
date_time <- paste(data$Date,data$Time)
day_week <- strptime(date_time, format ='%d/%m/%Y %H:%M:%S')
str(day_week)

# start png device
png("plot2.png",width =480,height=480)
# creates plot2.png with a width of 480 pixels and a height of 480 pixels
plot(day_week,data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

#saves figure
dev.off()