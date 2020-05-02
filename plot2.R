## This R script plots plot2.png

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

## Plot line graph of Global_active_power vs Day
png("plot2.png")
with(data, plot(DateTime,Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power(kilowatts)"))
dev.off()
