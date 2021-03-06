
# Download the Dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./Data.zip")

# Unzip the File
unzip("./Data.zip")

#Import the dplyr package
library(dplyr)


# Read the Dataset into R
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

# Convert the Date column to a character vector
data$Date<-as.character(data$Date)

# Filter the dataset to only include data from two dates
filtered_data<-filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open a graphics device
png(file = "Plot4.png")



# Change the mfcol settings to draw the plots in 2x2 matrix
filtered_data$newcol <- seq(1,length(filtered_data$Date))
xpos <- seq(1,length(filtered_data$newcol),by = (length(filtered_data$newcol)/2)-1)
par(mfcol = c(2,2))

#plotting Plot 1 
with(filtered_data,plot(newcol,Global_active_power,type = "l", axes = FALSE,xlab= "",ylab = "Global Active Power (Kilowatts)"))
axis(1,at = xpos, c("Thu","Fri","Sat"))
axis(2)
box(lty = 1)

# plotting plot 2
with(filtered_data,plot(newcol,Sub_metering_1,type = "l", axes = FALSE,xlab= "",ylab = "Energy Sub Metering"))
points(filtered_data$newcol,filtered_data$Sub_metering_2,type = "l",col = "Red")
points(filtered_data$newcol,filtered_data$Sub_metering_3,type = "l",col = "Blue")
axis(1,at = xpos, c("Thu","Fri","Sat"))
axis(2)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("Black","Red","Blue"))
box(lty = 1)

#plotting plot 3
with(filtered_data,plot(newcol,Voltage,type = "l", axes = FALSE,xlab= "datetime",ylab = "Voltage"))
axis(1,at = xpos, c("Thu","Fri","Sat"))
axis(2)
box(lty = 1)


#plotting plot 4
with(filtered_data,plot(newcol,Global_reactive_power,type = "l", axes = FALSE,xlab= "datetime",ylab = "Global Reactive Power (Kilowatts)"))
axis(1,at = xpos, c("Thu","Fri","Sat"))
axis(2)
box(lty = 1)


# Close the graphics device
dev.off()

