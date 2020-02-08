temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
energy_consumption <- read.delim(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
filtered_energy<- energy_consumption[energy_consumption$Date %in% c("1/2/2007","2/2/2007"),]
#Plot3
png(filename = "plot3.png", width = 480, height = 480,   pointsize = 12, bg = "white")
plot(filtered_energy$new_date ,filtered_energy$Sub_metering_1, type ="l" , ylab="Energy sub metering", xlab = "", col ="black" )                                                                                  
lines(filtered_energy$new_date ,filtered_energy$Sub_metering_2 , type ="l" ,  xlab = "", col ="red" )                                                                                  
lines(filtered_energy$new_date ,filtered_energy$Sub_metering_3 , type ="l" , xlab = "" , col ="blue")                                                                                  
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
dev.off()