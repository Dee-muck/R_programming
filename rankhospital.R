hd<-read.csv("hospital-data.csv", na.strings="Not Available",
             stringsAsFactors=FALSE )
rankhospital <- function(state, outcome, num = "best") {
        
        ## Read outcome data
        oocm<-read.csv("outcome-of-care-measures.csv",
                       na.strings="Not Available",stringsAsFactors=FALSE)
        
        ##11 - heart attack
        ##17 - heart failure
        ##23 - pneumonia
        
        if (outcome == "heart attack") {
                col_num <- 11
        }
        else if (outcome == "heart failure") {
                col_num <- 17
        }
        else if (outcome == "pneumonia") {
                col_num <- 23
        }
        ## Check that state and outcome are valid
        true_outcomes <- c("heart attack", "heart failure", "pneumonia")
        if (!state %in% oocm$State) {
                stop("invalid state")
        } else if(!outcome %in% true_outcomes) {
                stop("invalid outcome")
        } else {
                
                state_data<-oocm[oocm[,7]==state,] ## table for particular st
                state_data2<-state_data[c(2,col_num)] ## table for parameter
                
                ## NA removing
                data <- state_data2[complete.cases(state_data2[, 2]), ]
                
                ##Check if num is greater than nrows of Data 
                if (is.numeric(num) == TRUE) {
                        if (length(data[,2]) < num) {
                                return(NA)
                        }
                }
                
                ##Order data
                data.state <- data[order(data[,2], data$Hospital.Name), ]
                
        }
        
        ## setting num
        if (num=="best"){
                num <- 1
        } else if (num=="worst") {
                num <- length(data[,2])
        }
        
        hospitalName <- data.state$Hospital.Name[num]
        hospitalName
}