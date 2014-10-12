data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
data1 <- subset(data,Date=="1/2/2007")
data2 <- subset(data,Date=="2/2/2007")
dataset <- rbind(data1, data2)
names(dataset)

# Plot of Global Active Power with frrquency
png("plot1.png", width = 480, height=480)
hist(as.numeric(as.character(dataset$Global_active_power)), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.off()
