temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
energy_consumption <- read.delim(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
filtered_energy<- energy_consumption[energy_consumption$Date %in% c("1/2/2007","2/2/2007"),]
##Plot1
png(filename = "plot1.png", width = 480, height = 480,
    pointsize = 12, bg = "white")
hist(as.numeric(filtered_energy$Global_active_power),main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency",col="red")
dev.off()
new_date <-paste(filtered_energy$Date, filtered_energy$Time)
filtered_energy$new_date <- strptime(new_date ,format="%d/%m/%Y %H:%M:%S")