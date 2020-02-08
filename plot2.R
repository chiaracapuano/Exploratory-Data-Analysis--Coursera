temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
energy_consumption <- read.delim(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
filtered_energy<- energy_consumption[energy_consumption$Date %in% c("1/2/2007","2/2/2007"),]
#Plot2
png(filename = "plot2.png", width = 480, height = 480,   pointsize = 12, bg = "white")
plot(filtered_energy$new_date ,as.numeric(filtered_energy$Global_active_power), type ="l" , ylab="Global Active Power (kilowatts)", xlab = "" )                                                                                  
dev.off()