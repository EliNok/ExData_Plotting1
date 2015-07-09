
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
required_dates_only <- data[ which(data$Date =='2007-02-01' | data$Date =='2007-02-02' ),]

#create histogram Plot1
hist(required_dates_only$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency"     
     )

#save histogram to PNG file
dev.copy(png,file="plot1.png",width=480,height=480)

#closing device
dev.off()