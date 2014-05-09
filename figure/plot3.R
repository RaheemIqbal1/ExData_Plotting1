## ---------------
## Read the Data
## ---------------
## Read the a subset of electric power consumption data 
epc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";", 
                   col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

## Merge the Date and Time data into one column separated with a blank
cols <- c( 'Date' , 'Time' )
epc$Date_Time <- apply( epc[ , cols ] , 1 , paste , collapse = " " )

## Cast the combine 'Date and Time' data from factor type to Date Class  
epc$Date_Time <- strptime(epc$Date_Time, format='%d/%m/%Y %H:%M:%S') 

## --------------------------------------------
## 3. Line plot of 'Sub Metering 1, 2, 3' data
## --------------------------------------------
png(file = "plot3.png", width = 480, height = 480)

opar=par(ps=12)
plot_col <- c("red","green","blue")
plot(epc$Date_Time, epc$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "", col = plot_col[1])
lines(epc$Date_Time, epc$Sub_metering_2, type = "l", col = plot_col[2])
lines(epc$Date_Time, epc$Sub_metering_3, type = "l", col = plot_col[3])
opar=par(ps=8)
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = plot_col)

dev.off()

