#PLOT2 - basic plot Time x Global Active Power

pathX_pow = file.path("C:/Users/beatr/Desktop/CourseraR/4_Exploratory_Data_analysis/household_power_consumption.txt")
pow <- read.table(pathX_pow, header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings="?")
subpow <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")
#str(subpow)

subpow$Date <- as.Date(subpow$Date, format="%d/%m/%Y")
#str(subpow)
subpow$Time <- strptime(subpow$Time, format="%H:%M:%S")
#str(subpow)
subpow[1:1440,"Time"] <- format(subpow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpow[1441:2880,"Time"] <- format(subpow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
str(subpow)


# basic plot function
plot(subpow$Time, subpow$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power Vs Time") 

png("plot2.png", width=480, height=480)
dev.off()