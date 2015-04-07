# Course: Coursera - Exploratory Data Analysis - April 2015
# Course Project 1
# This file creates the 4th plot for the project
# Student Alias: Humilimath

# SETUP DATA IN MEMORY

library(dplyr)
library(lubridate)
elecdata <- tbl_df(read.table("../household_power_consumption.txt",sep=";",
                              header=TRUE,stringsAsFactors=FALSE,na.strings="?")) %>%    ## read in the table and convert to the dplyr format
  mutate(Time = dmy_hms(paste(Date,Time,sep=" "))) %>%                                   ## represent the date/time strings as time format
  select(-Date) %>%                                                                      ## Get rid of the now superfluous date column
  filter(Time >= ymd("2007-02-01"), Time < ymd("2007-02-03"))                            ## between 2007-02-01 and 2007-02-02 inclusive


# CREATE DEVICE TO SEND THE PLOT TO
png(filename="plot4.png")  ## Use default width and height values


# MAKE PLOTS 
par(mfrow=c(2,2))   ## Set it up as a 2x2 grid of plots

## Plot (1,1) Time series of Global active power (from plot2.R)
with(elecdata,plot(Time,Global_active_power,typ="l",xlab="",ylab="Global Active Power"))

## Plot (1,2) Time series of voltage
with(elecdata, plot(Time,Voltage, typ="l", xlab="datetime"))

## Plot (2,1) Time series of sub-metering as per plot3.R (but with no border around the legend)
with(elecdata,plot(Time,Sub_metering_1,typ="l",xlab="",ylab="Energy sub metering"))
with(elecdata,points(Time,Sub_metering_2,typ="l", col="red"))
with(elecdata,points(Time,Sub_metering_3,typ="l", col="blue"))
legend("topright",lty="solid", bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot (2,2) Time series of Global_reactive_power
with(elecdata,plot(Time,Global_reactive_power,type="l",xlab="datetime"))

# TURN OFF DEVICE
dev.off()