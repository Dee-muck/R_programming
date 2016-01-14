complete <- function(directory, id=1:332){
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
        answ <- data.frame(id=numeric(), nobs=numeric())
        for (i in id) {
                nameoffile <- iFileName(directory,i)
                data <- read.csv(nameoffile)
                answ <- rbind(answ,data.frame(id=i,nobs=nrow(data[complete.cases(data), ])))
        }
        answ
}