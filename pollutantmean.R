pollutantmean <- function(directory, pollutant, id=1:332){
       ##Creating filenames(can be 001,010 and 100)
        source("iFileName.R")
        monitor<-numeric()
        
         for (i in id) {
                 nameoffile <- iFileName(directory,i)
                 data <- read.csv(nameoffile)
                 if (pollutant == "sulfate") {
                         monitor <- c(monitor, data$sulfate)
                 } else if (pollutant == "nitrate") {
                         monitor <- c(monitor, data$nitrate)
                 }
         }
         mean(monitor, na.rm=TRUE)
}