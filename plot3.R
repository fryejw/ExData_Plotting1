
library(dplyr)

data <- read.table('./household_power_consumption.txt'
                   ,sep = ";"
                   ,header = TRUE
                   ,na.strings = "?") %>% 
        filter(as.factor(Date) == '1/2/2007' | as.factor(Date) == '2/2/2007') %>%
        mutate(date.time = as.POSIXct(paste(Date,Time),format = '%d/%m/%Y %H:%M:%S')
                ,day.of.week = weekdays(date.time))

#Plot 3
png('./plot3.png',width = 480, height = 480)
par(mfrow = c(1,1))
plot(data$Sub_metering_1
     , type = 'n'
     , ylab = 'Energy sub metering'
     , xaxt = 'n')
lines(data$Sub_metering_1
      , col = 'black')
lines(data$Sub_metering_2
      , col = 'red')
lines(data$Sub_metering_3
      , col = 'blue')
axis(side = 1
     ,at = c(0,60*24,60*24*2)
     ,labels = c('Thursday','Friday','Saturday'))
legend('topright'
       , legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       , col = c('black','red','blue')
       , lty = c(1,1,1))
dev.off()