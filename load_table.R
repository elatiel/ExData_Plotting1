load_table <- function(){
        
        filename <- "exdata-data-household_power_consumption.zip"
        
        ## Download and unzip the dataset
        if (!file.exists(filename)){
                fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                download.file(fileURL, filename)
        }  
        if (!file.exists("household_power_consumption")) { 
                unzip(filename)
        }
        
        require("data.table")
        
        f <- file.path(getwd(), "household_power_consumption.txt")
        dtable <- read.table(f,sep=";",header=TRUE, colClasses=c("character", "character", rep("numeric",7)), na="?")
        # convert date and time variables to Date/Time class
        dtable$Time <- strptime(paste(dtable$Date, dtable$Time), "%d/%m/%Y %H:%M:%S")
        dtable$Date <- as.Date(dtable$Date, "%d/%m/%Y")
        # subsetting to "2007-02-01", "2007-02-02"
        dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
        subtable <- subset(dtable, Date %in% dates)
        
        return (subtable)
        
}