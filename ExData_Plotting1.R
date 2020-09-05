df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

## Filter data set from 1-2.2.2007
df <- subset(df,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Deleting incomplete observation
df <- df[complete.cases(df),]

## Combine Date and Time column
dateTime <- paste(df$Date, df$Time)

## Naming the vector
dateTime <- setNames(dateTime, "DateTime")

## Removing Date and Time column
df <- df[ ,!(names(df) %in% c("Date","Time"))]

## Add DateTime column
df <- cbind(dateTime, df)

## Format dateTime Column
df$dateTime <- as.POSIXct(dateTime)
