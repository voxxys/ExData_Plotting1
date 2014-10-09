data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
data[data=="?"] <- NA

png("plot2.png",width=480,height=480)

Sys.setlocale("LC_TIME", "English")

temp <- cbind(as.character(data[,1]),as.character(data[,2]));
time <- apply(temp,1,function(x) paste(x,collapse = " "))

stime <- as.POSIXct(time,format="%d/%m/%Y %H:%M:%S")

plot(stime,data[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
