complete <- function(directory, id=1:332){
        ##Creating filenames(can be 001,010 and 100)
        source("iFileName.R")
        answ <- data.frame(id=numeric(), nobs=numeric())
        for (i in id) {
                nameoffile <- iFileName(directory,i)
                data <- read.csv(nameoffile)
                answ <- rbind(answ,data.frame(id=i,nobs=nrow(data[complete.cases(data), ])))
        }
        answ
}