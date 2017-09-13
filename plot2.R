
# create Plot2
par(mfrow = c(1, 1), mar = c(4, 4, 2, 2), oma = c(2, 2, 2, 2))
plot(Febclean$Metering,Febclean$Global_active_power, type = "l", xlab = "1+2 Febr 2007", ylab = "Global Active Power (Kilo-Watts)", col="black")
dev.copy(png, file = "Plot2.png")
dev.off()
