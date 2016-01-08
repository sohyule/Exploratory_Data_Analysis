# exploratory data analysis
# course-project-1
# plot 1


# read data
df<-read.csv("household_power_consumption.txt",na.strings="?",sep=";")
# convert date from character to date type
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
# check
str(df)
# subset only 2007-02-01 and 2007-02-02
df<-subset(df,Date %in% as.Date(c("2007-02-01","2007-02-02")))
# check
table(df$Date)

names(df)

# open the file
png("plot1.png",width=480,height=480)
# histogram
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
# close the file
dev.off()