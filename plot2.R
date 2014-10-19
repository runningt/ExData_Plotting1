input = read.table('../household_power_consumption.txt', sep=';', stringsAsFactor=FALSE, na.strings='?', header=TRUE)
library(dplyr)
my_df = tbl_df(input)
plot_days <- filter(my_df,Date=='1/2/2007'|Date=='2/2/2007')
#To get english weekdays
loc = Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "C")
plot_days <- mutate(plot_days, RDate = as.POSIXct(Date), abbreviate = TRUE)
Sys.setlocale("LC_TIME", loc)
png(file = "plot2.png", width = 480, height = 480)
with(plot_days, plot(RDate, Global_active_power, type='l',ylab='GlobalActivPower (kilowats)', xlab=''))
dev.off()

