ECPfile <- paste("https://archive.ics.uci.edu/ml/machine-learning-databases/00235//household_power_consumption.zip")
td = tempdir()    # create temp directory (default of R)
tf = tempfile(tmpdir=td, fileext = ".zip")  # create temp file (default of R)
download.file(ECPfile, tf)

fname = unzip(tf, list = TRUE)$Name[1]  # safe name of the file to be loaded
unzip(tf, files=fname, exdir= td, overwrite = TRUE) # unzip the loaded file

fpath = file.path(td, fname)  # safe the adress and file name

ECPsh1 <- read.table(fpath, sep = ";", header = TRUE)     # READ the downloaded and unzipped file
ECPsh2 <- as.data.frame(ECPsh2, keep.rownames = TRUE)     # Be sure the data is a Data frame

dim(ECPsh2)
head(ECPsh2)
names(ECPsh2)
summary(ECPsh2)

ECPfeb1 <- subset(ECPsh2, Date == "1/2/2007")             # subset the data of 01-02-2007 
ECPfeb2 <- subset(ECPsh2, Date == "2/2/2007")             # subset the data of 02-02-2007
Feb3 <- rbind(ECPfeb1, ECPfeb2)                           # Bind 1 feb. + 2 feb.

dim(Feb3)

Febdata <- as.character(Feb3$Date)                        # variabel date safe
Febtime <- as.character(Feb3$Time)                        # variabel time safe

# change all variables --> class nummeric
Feb3num <- data.frame(lapply(Feb3, function(x) as.numeric(as.character(x))))

#  sorry, I cannot use variable "date" for X-axis: 
#     Time = set in mine PC is Europe-format: Changing results in a warning:
#    OS reports request to set locale to "en_US", cannot be honored
#   Therfor creates an new variable: 1 upto 2880 for the x-axis

Metering <- (1:2880)

# Nummeric variables merge with original variables Data and Time
Febclean <- cbind(Feb3num, Febdata, Febtime, Metering)

# create Plot1
par(mfrow = c(1, 1), mar = c(4, 4, 2, 2), oma = c(2, 2, 2, 2))
with(Febclean, hist(Global_active_power, col = "red", xlab = "Global Active Power (Kilo-Watts)", main = "Global Active Power"))
dev.copy(png, file = "Plot1.png")
dev.off()