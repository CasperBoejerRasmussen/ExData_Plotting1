#Online course: Exploratory Data Analysis - Course Project 1
#https://www.coursera.org/learn/exploratory-data-analysis/peer/ylVFo/course-project-1

#create Github repository. 

library(tidyverse)
library(lubridate)

setwd("C:/Users/Casper/Desktop/Exploratory_Data_Analysis/Project1")

RAWdata <- as_tibble(read.delim("household_power_consumption.txt", sep = ";"))

#View(RAWdata)

RAWdata[RAWdata == "?"] <- "NA" #replacing missing values "?" with NA

data <- filter(RAWdata, Date == "1/2/2007"| Date == "2/2/2007")

#combine Date and Time
data <- mutate(data, DateTime = paste(Date,Time))
data[["DateTime"]] <- dmy_hms(data$DateTime)

#only sub3 is read as numeric. 
plot3 <- plot(x = data$DateTime,
              y = as.numeric(data$"Sub_metering_1"), 
              type = "l", 
              xlab ="", 
              ylab="Energy sub metering")
plot3

lines(x = data$DateTime, data$"Sub_metering_2", col = "red")
lines(x = data$DateTime, data$"Sub_metering_3", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),
       lty = 1)

png("plot3.png", width=480, height=480)
plot3 <- plot(x = data$DateTime,
              y = as.numeric(data$"Sub_metering_1"), 
              type = "l", 
              xlab ="", 
              ylab="Energy sub metering")
lines(x = data$DateTime, data$"Sub_metering_2", col = "red")
lines(x = data$DateTime, data$"Sub_metering_3", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),
       lty = 1)

dev.off()