library(dplyr)

data <- read.table('./household_power_consumption.txt'
                   ,sep = ";"
                   ,header = TRUE
                   ,na.strings = "?") %>% 
        filter(as.factor(Date) == '1/2/2007' | as.factor(Date) == '2/2/2007') %>%
        mutate(date.time = as.POSIXct(paste(Date,Time),format = '%d/%m/%Y %H:%M:%S')
               ,day.of.week = weekdays(date.time))
      


#Plot 4
png('./plot4.png',width = 480, height = 480)
par(mfrow = c(2,2))
#Top Left
plot(data$Global_active_power
     , type = 'l'
     , xlab = ''
     , ylab = 'Global Active Power (kilowatts)'
     , xaxt = 'n'
)
axis(side = 1
     , at = c(0,60*24,60*24*2)
     , labels = c('Thursday','Friday','Saturday'))
#Top Right
plot(data$Voltage
     , type = 'l'
     , xlab = 'datetime'
     , ylab = 'Voltage'
     , xaxt = 'n')
axis(side = 1
     , at = c(0,60*24,60*24*2)
     , labels = c('Thursday','Friday','Saturday'))
#Bottom Left
plot(data$Sub_metering_1
     , type = 'n'
     , xlab = ''
     , ylab = 'Energy sub metering'
     , xaxt = 'n'
)
lines(data$Sub_metering_1
      , col = 'black')
lines(data$Sub_metering_2
      , col = 'red')
lines(data$Sub_metering_3
      , col = 'blue')
axis(side = 1
     , at = c(0,60*24,60*24*2)
     , labels = c('Thursday','Friday','Saturday'))
legend('topright'
       , legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       , col = c('black','red','blue')
       , lty = c(1,1,1)
       , bty = 'n')
#Bottom Right
plot(data$Global_reactive_power
     , type = 'l'
     , xlab = 'datetime'
     , ylab = 'Global_reactive_power'
     , xaxt = 'n')
axis(side = 1
     , at = c(0,60*24,60*24*2)
     , labels = c('Thursday','Friday','Saturday'))
dev.off()
