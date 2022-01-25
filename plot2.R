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
plot2 <- plot(x = data$DateTime,
              y = as.numeric(data$"Global_active_power"), 
              type = "l", 
              xlab ="", 
              ylab="Global Active Power (kilowatts)")
plot2

png("plot2.png", width=480, height=480)
plot2 <- plot(x = data$DateTime,
              y = as.numeric(data$"Global_active_power"), 
              type = "l", 
              xlab ="", 
              ylab="Global Active Power (kilowatts)")
dev.off()