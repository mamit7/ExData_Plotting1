## This R script plots plot4.png

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

## Plot the graphs
png("plot4.png")
par(mfcol = c(2,2))

with(data, plot(DateTime,Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power"))

with(data, plot(DateTime, Sub_metering_1, type = "l", xlab = "",
                ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime"))

with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()