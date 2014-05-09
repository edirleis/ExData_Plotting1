
#read table into dt as data frame
dt <- read.csv('household_power_consumption.txt',na.strings=c("NA","N/A","","?"), sep=";", stringsAsFactors=FALSE)

#create new column Dia from transforming Date field into Date type
#dt[, Dia:= as.Date(dt$Date , "%d/%m/%Y")]
dt$Dia <- as.Date(dt$Date , "%d/%m/%Y")


#make sure next subset command finds dates in range(?) case data is not "date" in order
dt[order(dt$Dia),]  

#subset to the specified dates
firstday <- as.Date("2007-02-01")
lastday <- as.Date("2007-02-02")
sub <- subset(dt, dt$Dia==firstday | dt$Dia == lastday )


#add date and time into new column called Tempo
sub$Tempo <- as.POSIXct(strptime(x=paste(sub$Date,sub$Time),format="%d/%m/%Y %T"))

##Plot 2
png("plot2.png", width = 480, height = 480)
plot(x= sub$Tempo, y=sub$Global_active_power, type="lines", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()