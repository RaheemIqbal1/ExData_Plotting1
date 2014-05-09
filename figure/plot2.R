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

## -------------------------------------------
## 2. Line Plot of 'Global Active Power' data
## -------------------------------------------
png(file = "plot2.png", width = 480, height = 480)

opar=par(ps=12)
plot(epc$Date_Time, epc$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()