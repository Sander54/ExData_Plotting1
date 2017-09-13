# create Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(2, 2, 2, 2))

plot(Febclean$Metering,Febclean$Global_active_power, type = "l", xlab = "1+2 Febr 2007", ylab = "Global Active Power (Kilo-Watts)", col="black")

plot(Febclean$Metering,Febclean$Voltage, type = "l", xlab = "1+2 Febr 2007", ylab = "Voltage", col="black")

with(Febclean, plot(Metering,Febclean$Sub_metering_1,type = "l",xlab = "1+2 Febr 2007",ylab = "Enery Sub-metering", col="grey"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.col=c("grey","red","blue"))
vectorSub2 <- c(Febclean$Sub_metering_2)
lines(Febclean$Metering,vectorSub2, type ="l", col = "red")
vectorSub3 <- c(Febclean$Sub_metering_3)
lines(Febclean$Metering,vectorSub3, type ="l", col = "blue")

plot(Febclean$Metering,Febclean$Global_reactive_power, type = "l", xlab = "1+2 Febr 2007", ylab = "Global_reactive_power", col="black")

dev.copy(png, file = "Plot4.png")
dev.off()
