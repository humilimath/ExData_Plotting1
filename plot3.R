# Course: Coursera - Exploratory Data Analysis - April 2015
# Course Project 1
# This file creates the 3rd plot for the project
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
png(filename="plot3.png")  ## Use default width and height values


# MAKE GRAPH
with(elecdata,plot(Time,Sub_metering_1,typ="l",xlab="",ylab="Energy sub metering"))
with(elecdata,points(Time,Sub_metering_2,typ="l", col="red"))
with(elecdata,points(Time,Sub_metering_3,typ="l", col="blue"))
legend("topright",lty="solid", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# TURN OFF DEVICE
dev.off()