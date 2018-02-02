setwd(
     "C:/Users/chad.koziel/OneDrive/Documents/Coursera R/Exploratory Data Analysis/Assignment 1"
)

hpc <-
     data.frame(read.table(
          "household_power_consumption.txt",
          header = TRUE ,
          sep = ";"
     ))

# filter, format data

hpc <- hpc[(hpc$Date == "1/2/2007") | (hpc$Date == "2/2/2007"), ]
hpc$DateTime <-
     as.POSIXlt(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

hpc <- hpc[, 3:10]
for (i in 1:7) {
     hpc[, i] <- as.numeric(as.character(hpc[, i]))
}

#plot, output data
png("Plot1.png", width = 480, height = 480)
hist(
     hpc$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
)
dev.off()