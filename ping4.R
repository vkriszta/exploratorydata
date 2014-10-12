dataall<-read.table('./household_power_consumption.txt', header=FALSE, sep=";",stringsAsFactors=FALSE, fill=TRUE)

filter1<-c(dataall[,1] == "1/2/2007")
data1<-data.frame(dataall[filter1,])

filter2<-c(dataall[,1] == "2/2/2007")
data2<-data.frame(dataall[filter2,])
data<-rbind(data1,data2)

times<-strptime(paste(data[,1], data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")

png("ping4.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "C")

par(mfrow=c(2,2))

plot(times, data[,3], ylab= "Global Active Power (kilowatts)", xlab = " ", pch = "")
lines(times, data[,3])

plot(times, data[,5], ylab="Voltage",xlab="datetime", pch = "")
lines(times, data[,5])

plot(times, data[,7], ylab= "Energy sub metering", xlab = " ", pch = "")
lines(times, data[,7])
lines(times, data[,8], col="red")
lines(times, data[,9], col="blue")
text<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", text, lty=1, col=c("black","red","blue"), bty="n")

plot(times, data[,4], ylab="Global_reactive_power",xlab="datetime", pch="")
lines(times, data[,4])

dev.off()