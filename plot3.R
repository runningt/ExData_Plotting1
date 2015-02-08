input = read.table('../household_power_consumption.txt', sep=';', stringsAsFactor=FALSE, na.strings='?', header=TRUE)
library(dplyr)
my_df = tbl_df(input)
plot_days = filter(my_df,Date=='1/2/2007'|Date=='2/2/2007')

plot_days <- mutate(plot_days, RDate = as.POSIXct(Date), abbreviate = TRUE)
png(file = "plot3.png", width = 480, height = 480)
 
plot(plot_days$Sub_metering_1+plot_days$Sub_metering_2+plot_days$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="")

#points(plot_days$RDate,plot_days$Sub_metering_1,pch=19,type="l")
#points(plot_days$RDate,plot_days$Sub_metering_2,pch=19,type="l",col="red")
#points(plot_days$RDate,plot_days$Sub_metering_3,pch=19,type="l",col="blue")
legend("topright", pch = c(NA,NA,NA), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=1)
dev.off()
