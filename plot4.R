# exploratory data analysis
# course-project-1
# plot 4

# read data
df<-read.csv("household_power_consumption.txt",na.strings="?",sep=";")
# convert date from character to date type
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
# check
#str(df)
# subset only 2007-02-01 and 2007-02-02
df<-subset(df,Date %in% as.Date(c("2007-02-01","2007-02-02")))
# create a new variable to combine date and time
datetime<-with(df,paste(Date,Time))
df$datetime<-strptime(datetime, "%Y-%m-%d %H:%M:%S")

# save the plot to a png file
# open the file
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
# plot21
plot(df$datetime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# plot 2
with(df,plot(datetime,Voltage,type="l"))
# plot 3
plot(df$datetime,df$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
points(df$datetime,df$Sub_metering_2,type="l",col="red")
points(df$datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n")
# plot4
with(df,plot(datetime,Global_reactive_power,type="l"))
# close the file
dev.off()
