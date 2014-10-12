dataall<-read.table('./household_power_consumption.txt', header=FALSE, sep=";",stringsAsFactors=FALSE, fill=TRUE)

filter1<-c(dataall[,1] == "1/2/2007")
data1<-data.frame(dataall[filter1,])

filter2<-c(dataall[,1] == "2/2/2007")
data2<-data.frame(dataall[filter2,])
data<-rbind(data1,data2)


png("ping1.png", width = 480, height = 480)
hist(as.numeric(data[,3]), xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off()

