#Plot4
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
png("plot4.png",width =480,height=480)
# creates plot4.png with a width of 480 pixels and a height of 480 pixels
par(mfrow =c(2,2))
plot(day_week,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(day_week,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(day_week,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(day_week,data$Sub_metering_2,col = "red")
lines(day_week,data$Sub_metering_3,col= "blue")
legend("topright", lty=1,bty ="n",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(day_week,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#saves figure
dev.off()