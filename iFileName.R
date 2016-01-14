iFileName <- function(directory, id) {
        if (id < 10) {
                filename = paste(directory, "/","00", id, ".csv", sep="")
        } else if (id >= 10 && id < 100) {
                filename = paste(directory, "/", "0", id, ".csv", sep="")
        } else {
                filename = paste(directory, "/", id, ".csv", sep="")
        }
}