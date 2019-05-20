library(dplyr)

data <- read.table('./household_power_consumption.txt'
                   ,sep = ";"
                   ,header = TRUE
                   ,na.strings = "?") %>% 
        filter(as.factor(Date) == '1/2/2007' | as.factor(Date) == '2/2/2007') %>%
        mutate(date.time = as.POSIXct(paste(Date,Time),format = '%d/%m/%Y %H:%M:%S')
               ,day.of.week = weekdays(date.time))

#Plot 2
png('./plot2.png',width = 480, height = 480)
par(mfrow = c(1,1))
plot(data$Global_active_power
     , type = 'l'
     , xlab = ''
     , ylab = 'Global Active Power (kilowatts)'
     , xaxt = 'n'
)
axis(side = 1
     ,at = c(0,60*24,60*24*2)
     ,labels = c('Thursday','Friday','Saturday'))
dev.off()