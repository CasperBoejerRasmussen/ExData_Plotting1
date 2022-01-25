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
data[["Date"]] <- dmy(data$Date)
data[["Time"]] <- hms(data$Time)

#only sub3 is read as numeric. 
plot1 <- hist(as.numeric(data$"Global_active_power"), col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

png("plot1.png", width=480, height=480)
hist(as.numeric(data$"Global_active_power"), col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()