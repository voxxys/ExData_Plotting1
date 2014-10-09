data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
data[data=="?"] <- NA

png("plot1.png",width=480,height=480)
hist(data[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()