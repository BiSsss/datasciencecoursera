setwd("~/Desktop")
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dat<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
dat$Date<-strptime(dat$Date,format="%d/%m/%Y")
dat$Time<-strptime(dat$Time,"%H:%M:%S")
hist(dat$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power(kilowatts)",col="red",ylim=c(0,1200))