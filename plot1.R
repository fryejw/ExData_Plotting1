
library(dplyr)

data <- read.table('./household_power_consumption.txt'
                   ,sep = ";"
                   ,header = TRUE
                   ,na.strings = "?") %>% 
        filter(as.factor(Date) == '1/2/2007' | as.factor(Date) == '2/2/2007') %>%
        mutate(date.time = as.POSIXct(paste(Date,Time),format = '%d/%m/%Y %H:%M:%S')
               ,day.of.week = weekdays(date.time))

#Plot 1
png('./plot1.png',width = 480, height = 480)
par(mfrow = c(1,1))
hist(data$Global_active_power
     , col = 'red'
     , xlab = 'Global Active Power (kilowatts)'
     , ylab = 'Frequency'
     , main = 'Global Active Power')
dev.off()




