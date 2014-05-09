
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

##Plot 1
png("plot1.png", width = 480, height = 480)
hist(sub$Global_active_power,freq=T, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
