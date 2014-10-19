input = read.table('../household_power_consumption.txt', sep=';', stringsAsFactor=FALSE, na.strings='?', header=TRUE)
library(dplyr)
my_df = tbl_df(input)
plot_days = filter(my_df,Date=='1/2/2007'|Date=='2/2/2007')

png(file = "plot3.png", width = 480, height = 480)
plot(plot_days[3], type='n',ylab='GlobalActivPower (kilowats)', xlab='')

dev.off()
