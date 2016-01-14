pollutantmean <- function(directory, pollutant, id=1:332){
       ##Creating filenames(can be 001,010 and 100)
         iFileName <- function(directory, id) {
                if (id < 10) {
                        filename = paste(directory, "/","00", id, ".csv", sep="")
                } else if (id >= 10 && id < 100) {
                        filename = paste(directory, "/", "0", id, ".csv", sep="")
                } else {
                        filename = paste(directory, "/", id, ".csv", sep="")
                }
         }
         for (i in id) {
                 data <- read.csv(iFilename)
                 monitor<-numeric()
                 if (pollutant == "sulfate") {
                         monitor <- c(monitor, data$sulfate)
                 } else if (pollutant == "nitrate") {
                         monitor <- c(monitor, data$nitrate)
                 }
         }
         mean(monitor, na.rm-TRUE)
}