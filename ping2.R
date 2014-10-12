dataall<-read.table('./household_power_consumption.txt', header=FALSE, sep=";",stringsAsFactors=FALSE, fill=TRUE)

filter1<-c(dataall[,1] == "1/2/2007")
data1<-data.frame(dataall[filter1,])

filter2<-c(dataall[,1] == "2/2/2007")
data2<-data.frame(dataall[filter2,])
data<-rbind(data1,data2)

times<-strptime(paste(data[,1], data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")

png("ping2.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "C")
plot(times, data[,3], ylab= "Global Active Power (kilowatts)", xlab = " ", pch = "")
lines(times, data[,3])
dev.off()