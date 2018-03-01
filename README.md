# module4_project1
Coursera Exploratory Data Analysis Repo for its first project. 

This project is composed of 3 R-scripts:
  1. plot1.R
  2. plot2.R
  3. plot3.R

These programs process a dataset and create plots of histogram and line plots for different variables in the dataset. These plots that are included in this repo are named:
  1. plot1.png
  2. plot2.png
  3. plot3.png
  
## Objectives  
The goal of the assignment was simply to examine how the household energy usage varies over a 2 day period.
To be able to reconstruct the plots created by the instructor of the course.

## Dataset Information
The dataset used in the assignment is called “Individual household electric power consumption Data Set” and was accessed from  UC Irvine Machine Learning Repository. The URL of the data is #https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip. This is the measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. It has has 2,075,259 rows and 9 columns. Data from data from the dates 2007-02-01 and 2007-02-02 were only processed.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

    Date: Date in format dd/mm/yyyy
    Time: time in format hh:mm:ss
    Global_active_power: household global minute-averaged active power (in kilowatt)
    Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
    Voltage: minute-averaged voltage (in volt)
    Global_intensity: household global minute-averaged current intensity (in ampere)
    Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
    Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
    Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
    
## Making Plots
Plot1 - creates a histogram of the Global Active Power variable and save it to a png file (plot1.png) with a size of 480 x 480 pixels.
Plot2 - creates a line plot of the Global Active Power against the datetime of the dataset labeled as the weekdays of the dates. The plot is saved as png file (plot2.png) with a size of 480x480 pixels.
Plot3 - creates a line plot that highlights the comparison among the 3 energy sub- meters (Sub_metering_1, Sub_metering_2, Sub_metering_3) through the 2-day period.The plot is saved as png file (plot3.png) with a size of 480x480 pixels.
Plot4 - creates a multiple base plot of the different variables mentioned above but with the addition of the voltage variable plotted with the datetime. The plot is saved as png file (plot4.png) with a size of 480x480 pixels. 
