# create Plot3
with(Febclean, plot(Metering,Febclean$Sub_metering_1,type = "l",xlab = "1+2 Febr 2007",ylab = "Enery Sub-metering", col="grey"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.col=c("grey","red","blue"))

# create vector with data for 2nd line
vectorSub2 <- c(Febclean$Sub_metering_2)
lines(Febclean$Metering,vectorSub2, type ="l", col = "red")

# create vector with data for 3th line
vectorSub3 <- c(Febclean$Sub_metering_3)
lines(Febclean$Metering,vectorSub3, type ="l", col = "blue")

dev.copy(png, file = "Plot3.png")
dev.off()
