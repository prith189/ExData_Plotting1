
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
png(file = "Plot1.png")

# Plot the required data
with(filtered_data,hist(Global_active_power,title = "Global Active Power",xlab = "Global Active Power (Kilowatts)",ylab = "Frequency",col = "Red"))
points(title = "Global Active Power")
# Close the graphics device
dev.off()



