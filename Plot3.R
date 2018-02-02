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
png("Plot3.png", width = 480, height = 480)
plot( x = hpc$DateTime,
     y = hpc$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = ""
)
par(new=T)
lines( x = hpc$DateTime,
      y = hpc$Sub_metering_2,
      type = "l",
      col = "red"
 
)
par(new=T)
lines( x = hpc$DateTime,
      y = hpc$Sub_metering_3,
      type = "l",
      col = "blue"
)
legend("topright",legend=colnames(hpc[,5:7]),lty=1,lwd=3,col=c("black","red","blue"))
dev.off()