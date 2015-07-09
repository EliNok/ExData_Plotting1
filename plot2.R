
# define my own date class 
#for easy manipulation with dataframe' dates 
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

#read data from file
data <- read.csv("household_power_consumption.txt",
                 sep=';',
                 colClasses=c("myDate","character",rep("numeric",7)),
                 na.strings="?")


#subsetting required dates from dataframe
required_dates <- data[ which(data$Date =='2007-02-01' | data$Date =='2007-02-02' ),]

#concatatinate Date and Time
required_dates$DateTime <- strptime(paste(required_dates$Date,required_dates$Time),
                                         format="%Y-%m-%d %H:%M:%S"
                                         )

#define PNG file
png(filename="plot2.png", height=480, width=480)

#create plot
plot(required_dates$DateTime,
     required_dates$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

#closing device
dev.off()