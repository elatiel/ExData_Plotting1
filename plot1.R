source("load_table.R")

plot1 <- function(data=NULL) {
        if(is.null(data))
                data <- load_table()
        
        f <- file.path(getwd(), "plot1.png")
        png(filename=f, width=480, height=480)
        
        hist(data$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        
        dev.off()
}

