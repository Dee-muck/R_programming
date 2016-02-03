rankall <- function(outcome, num = "best") {
        hd<-read.csv("hospital-data.csv", na.strings="Not Available",stringsAsFactors=FALSE)
        ## Read outcome data
        oocm<-read.csv("outcome-of-care-measures.csv",
                       na.strings="Not Available",stringsAsFactors=FALSE)
        ##11 - heart attack
        ##17 - heart failure
        ##23 - pneumonia

        if (outcome == "heart attack") {
                col_num <- 11
        } else if (outcome == "heart failure") {
                col_num <- 17
        }else if (outcome == "pneumonia") {
                col_num <- 23
        }        
        
        ## Check that outcome is valid
        true_outcomes <- c("heart attack", "heart failure", "pneumonia")
        if (!outcome %in% true_outcomes) {
                stop("invalid outcome")
        } else {
                pre_data<-oocm[c(2,7,col_num)] ## table for parameter
                
                ## NA removing
                data <- pre_data[complete.cases(pre_data[,3]), ]
                
                ## Ordering data
                data.ordered <- data[order(data[,2],data[,3] ,data$Hospital.Name), ]
                
                ##Splitting data by State (list of dataFrames!)
                data.splitted <- split(data.ordered, data.ordered$State)
                
                ##Function that returns hospital name
                hospitalNameFunction <-function(state_data, num) {
                        if (num == "best") {
                                state_data$Hospital.Name[1]
                        } else if (num == "worst") {
                                state_data$Hospital.Name[length(state_data[,3])]
                        } else if (is.numeric(num)) {
                                state_data$Hospital.Name[num]
                        }            
                }
                
                result <- sapply(data.splitted, hospitalNameFunction, num)
                data.frame(hospital = result, state = names(result), row.names = names(result))
        }
}