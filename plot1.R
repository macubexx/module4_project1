#Exploratory Data Analysis Project 1 : Plot1
#by macubexx
#Feb 24, 2018

#This script generates a histogram of one of the variables of the dataset (Global Active Power)
#The plot is saved to a png file into the directory.

#The dataset entitled "Electric power consumption " can be downloaded from
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Description: Measurements of electric power consumption in one household with a one-minute 
#sampling rate over a period of almost 4 years. Different electrical quantities and some sub-
#metering values are available.

library(dplyr)
library(lubridate)
library(datasets)

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
elec_data<-read.csv2("./electric_consumption/household_power_consumption.txt",header=TRUE, sep = ';', na.strings = "?")

#use data from the dates 2007-02-01 and 2007-02-02
elec_data$Date<- as.Date(elec_data$Date, "%d/%m/%Y")
elec_data$Time<- strptime(elec_data$Time, "%H:%M:%S")
elec_data$Time<- as.POSIXct(elec_data$Time) #, "%Y-%m-%d %H:%M:%S", tz = "GMT"
#filter 2007-02-01 to 2007-02-02 dates
selected_data<-with(elec_data, elec_data[(Date >= "2007-02-01" & Date <= "2007-02-02"),])

#check for missing values in the selected data
check_na <- selected_data[rowSums(is.na(selected_data)) > 0,]

# Plot1 -- histogram of the Global Active Power (kilowatts)
glob_act_power<- as.numeric(as.character(selected_data$Global_active_power))
# save to png file
png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
plot1<-hist(glob_act_power,yaxt="n",main="", cex.axis=1,cex.lab =1,cex.main=1,breaks =20, col = "red" ,ylab ="Frequency", xlab= "Global Active Power (kilowatts)")
title(main = "Global Active Power", col.main="black", font.main=2)
axis(2, at=seq(0, max(plot1$counts), by=200),labels=seq(0, max(plot1$counts), by=200) ,cex.axis=1, cex.lab = 1)
dev.off()