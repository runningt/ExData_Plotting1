input = read.table('../household_power_consumption.txt', sep=';', stringsAsFactor=FALSE, na.strings='?', header=TRUE)
library(dplyr)
my_df = tbl_df(input)
plot_days = filter(my_df,Date=='1/2/2007'|Date=='2/2/2007')
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
loc = Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
plot_days <- mutate(plot_days, RDate = as.POSIXct(Date), abbreviate = TRUE)
Sys.setlocale("LC_TIM#E", loc)

plot(plot_days$Global_active_power, type='l',ylab='GlobalActivPower', xlab='')
plot(plot_days$Voltage, type='l',ylab='Voltage', xlab='datetime')
plot(plot_days$Sub_metering_1+plot_days$Sub_metering_2+plot_days$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="")
legend("topright", pch = c(NA,NA,NA), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=1)
plot(plot_days$Global_reactive_power, type='l',ylab='Global_reactiv_power', xlab='datetime')


dev.off()
