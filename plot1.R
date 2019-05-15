#PLOT 1 - Histogram 

#histogram
pathX_pow = file.path("C:/Users/beatr/Desktop/CourseraR/4_Exploratory_Data_analysis/household_power_consumption.txt")
pow <- read.table(pathX_pow, header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings="?")
subpow <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")
str(subpow)

#histogram
hist(subpow$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
png("plot1.png", width=480, height=480)
dev.off()
