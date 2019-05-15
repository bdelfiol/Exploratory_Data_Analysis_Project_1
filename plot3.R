#PLOT 3

pathX_pow = file.path("C:/Users/beatr/Desktop/CourseraR/4_Exploratory_Data_analysis/household_power_consumption.txt")
pow <- read.table(pathX_pow, header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings="?")
subpow <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")
str(subpow)
subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")
subpow$Time <- strptime(subpow$Time, format="%H:%M:%S")
str(subpow)
subpow[1:1440,"Time"] <- format(subpow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpow[1441:2880,"Time"] <- format(subpow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
str(subpow)

?with(subpow,{plot(Sub_metering_1 ~ Time, type="l", xlab= "", ylab="Energy Sub Metering")})
?lines(subpow,lines(Time, Sub_metering_2),col="red")
?lines(subpow,lines(Time ,Sub_metering_3),col="blue")


legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png("plot3.png", width=480, height=480)
dev.off()