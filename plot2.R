#Exploratory Data Analysis Project 1 : plot2
#by macubexx
#Feb 25, 2018

#This script executes a line plot of a variable that is periodically plotted against time
#for particular dates. The image is saved into a png file in a working directory.

#The dataset entitled "Electric power consumption " can be downloaded from
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Description: Measurements of electric power consumption in one household with a one-minute 
#sampling rate over a period of almost 4 years. Different electrical quantities and some sub-
#metering values are available.

library(dplyr)
library(lubridate)
library(datasets)
#library(ggplot2)
#download dataset
#setwd("E:/..")
elec_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
elec_df<- download.file(elec_url, destfile =  "electric_consumption.zip")
files<- unzip(zipfile = "electric_consumption.zip", exdir = "electric_consumption")  #sh**!!! debug: when working in thecurrent directory, use this arg for unzip

#compute required memory for the dataset
memory <- round(2075259*9*8/2^{20},2) #142.5 MB, 0.142 GB

#read txt file
#elec_data<-read.table("./electric_consumption/household_power_consumption.txt",header=TRUE)
#filter missing values coded as (?) by replacing these values with NA
elec_data<- read.csv2("./electric_consumption/household_power_consumption.txt",header=TRUE, sep = ';', na.strings = "?")

#use data from the dates 2007-02-01 and 2007-02-02
elec_data$Date<- as.Date(elec_data$Date, "%d/%m/%Y")
elec_data$Time<- strptime(elec_data$Time, "%H:%M:%S")
elec_data$Time<- as.POSIXct(elec_data$Time) #"%Y-%m-%d %H:%M:%S", tz = "GMT"

#filter 2007-02-01 to 2007-02-02 dates
selected_data<-with(elec_data, elec_data[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

#check for missing values in the selected data
check_na <- selected_data[rowSums(is.na(selected_data)) > 0,]

# Plot2 -- Periodic line plot of Global Active Power (kilowatts) vs Time
glob_active<- as.numeric(as.character(selected_data$Global_active_power))
#periodically plot the selected data for the given dates
wkdays <- weekdays(selected_data$Date) #know the weekdays
table(weekdays(selected_data$Date)) #count Friday - 1440, Thurrsday - 1440
#format "Time" as character to label the ticks with the weekdays
selected_data[1:1440,"Time"] <- format(selected_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
selected_data[1441:2880,"Time"] <- format(selected_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white") # save to png file
plot(selected_data$Time, glob_active, type="l",xlab = " ", ylab = "Global Active Power (kilowatts)") 
dev.off()
