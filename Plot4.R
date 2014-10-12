powerConsumption <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
powerConsumption2 <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"),]
# Concatante Date and Time variables
powerConsumption2$dateTime = paste(powerConsumption2$Date, powerConsumption2$Time)

# Convert to Date/Time class
powerConsumption2$dateTime <- strptime(powerConsumption2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(powerConsumption2)

png("plot4.png", width=480, height=480, units="px")
# Plot Energy sub metering
par(mfrow=c(2,2))
plot(dateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power")

plot(dateTime, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(dateTime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
