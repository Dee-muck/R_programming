setwd("/Users/Dimak/R/Assignment3-data")
hd<-read.csv("hospital-data.csv", na.strings="Not Available",
             stringsAsFactors=FALSE )

best <- function(state, outcome) {
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
                
                state_list <- state_data[, col_num] ## list for parameter
                min <- min(state_list, na.rm=TRUE)
                min_index <- which(state_list == min)
                hospital_name <- state_data[min_index, 2]
                sorted_hospital<-sort(hospital_name)
                sorted_hospital
        ## Return hospital name in that state with lowest 30-day death rate 
        }
        
      
       
}