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

##----------------
## 4. Four Plots
##----------------
png(file = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

## -------------------------------------------
## 1. Line Plot of 'Global Active Power' data
## -------------------------------------------
opar=par(ps=12)
plot(epc$Date_Time, epc$Global_active_power, type = "l", ylab="Global Active Power", xlab="")

## ------------------------------------------------
## 2. Plot a line plot of 'Sub Metering 1, 2, 3' data
## ------------------------------------------------
opar=par(ps=12)
plot_col <- c("red","green","blue")
plot(epc$Date_Time, epc$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "", col = plot_col[1])
lines(epc$Date_Time, epc$Sub_metering_2, type = "l", col = plot_col[2])
lines(epc$Date_Time, epc$Sub_metering_3, type = "l", col = plot_col[3])
opar=par(ps=9)
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = plot_col, bty = "n")

## -----------------------------------
## 3. Plot a line plot of 'Voltage' data
## -----------------------------------
opar=par(ps=12)
plot(epc$Date_Time, epc$Voltage, type = "l", ylab="Voltage", xlab="datetime")

## -------------------------------------------------
## 4. Plot a line plot of 'Global_reactive_power' data
## -------------------------------------------------
opar=par(ps=12)
plot(epc$Date_Time, epc$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
