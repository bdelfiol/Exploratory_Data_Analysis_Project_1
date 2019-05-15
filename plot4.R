#PLOT 4

pathX_power = file.path("C:/Users/beatr/Desktop/CourseraR/4_Exploratory_Data_analysis/household_power_consumption.txt")
pow <- read.table(pathX_power, header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings="?")
subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")
subpow$Time <- strptime(subpow$Time, format="%H:%M:%S")
str(subpow)
subpow[1:1440,"Time"] <- format(subpow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpow[1441:2880,"Time"] <- format(subpow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
str(subpow)


par(mfrow = c(2,2))

plot(subpow$Time, subpow$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)") #gráfico 1 
plot(subpow$Time, subpow$Voltage, type = "l", xlab = "Datetime", ylab= "Voltage") #gráfico 2

plot(subpow$Time, subpow$Sub_metering_1, type="n", xlab= "", ylab="Energy Sub Metering")#gráfico 3
points(subpow$Time, subpow$Sub_metering_1, type="l")
points(subpow$Time, subpow$Sub_metering_2, type="l", col="red")
points(subpow$Time, subpow$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3", cex = 0.6))

plot(subpow$Time, subpow$Global_reactive_power, type = "l", xlab = "Datetime", ylab= "Global_reactive_power") #gráfico 4

png("plot4.png", width=480, height=480)
dev.off()
