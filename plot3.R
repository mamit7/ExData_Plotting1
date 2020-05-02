## This R script plots plot3.png

library(dplyr)
library(lubridate)

## Read the data, assuming the is saved in the file "household_power_consumption.txt"
## in the current working directory.
data <- read.table("household_power_consumption.txt", sep = ";", 
                   skip = 66637, nrows = 2880, stringsAsFactors = FALSE, 
                   col.names = colnames(read.table
                   ("household_power_consumption.txt", 
                   nrow = 1, header = TRUE, sep = ";")))


## Convert Date and Time variables to Date/Time classes
data <- mutate(data, DateTime = dmy_hms(paste(Date,Time)))

## Plot line graphs of Sub_metering vs Day
png("plot3.png")
with(data, plot(DateTime, Sub_metering_1, type = "l", xlab = "",
                ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = 1, col = c("black", "red", "blue"))
dev.off()