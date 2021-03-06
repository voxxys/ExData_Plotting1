data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";")
data[data=="?"] <- NA

png("plot4.png",width=480,height=480)

Sys.setlocale("LC_TIME", "English")

temp <- cbind(as.character(data[,1]),as.character(data[,2]));
time <- apply(temp,1,function(x) paste(x,collapse = " "))

stime <- as.POSIXct(time,format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(stime,data[,3],type="l",xlab="",ylab="Global Active Power")
plot(stime,data[,5],type="l",xlab="datetime",ylab="Voltage")
plot(stime,data[,7],type="l",xlab="",ylab="Energy sub metering")
points(stime,data[,8],col="red",type="l")
points(stime,data[,9],col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xjust=1,yjust=1,lty=c(1,1,1),col=c("black","red","blue"),bty = "n")
plot(stime,data[,4],type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off()