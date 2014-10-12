input = read.csv('../household_power_consumption.txt', sep=';', stringsAsFactor=FALSE)
library(dplyr)
my_df = tbl_df(input)
plot_days = filter(my_df,Date=='1/2/2007'|Date=='2/2/2007')
plot(plot_days[3], type='l',ylab='GlobalActivPower (kilowats)', xlab='')


