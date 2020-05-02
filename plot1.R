## This R script plots plot1.png

## Read the data, assuming the is saved in the file "household_power_consumption.txt"
## in the current working directory.
data <- read.table("household_power_consumption.txt", sep = ";", 
                           skip = 66637, nrows = 2880, stringsAsFactors = FALSE, 
                           col.names = colnames(read.table
                           ("household_power_consumption.txt", 
                            nrow = 1, header = TRUE, sep = ";")))

## Plot histogram of Global_active_power in png
png("plot1.png")
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)"))
dev.off()


