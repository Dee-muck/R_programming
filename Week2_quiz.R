library(httr)
library(httpuv)
library(jsonlite)
library(sqldf)

##Q1
oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "5c626b9c606f5d6880cb",
                   secret = "dbd655e155b8fdeb8e52046fe59af07efcb0fc60")

##Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
##req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
jsondata<-content(req)

for (i in 1:length(jsondata)) {
        repo <- jsondata[[i]]
        if (repo$name == "datasharing") {
                ds_repo = repo
        }
}

ds_repo$created_at

##Q2
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile = "./acs.csv", method="curl")
acs <- read.csv("acs.csv", header = TRUE, sep = ",")

sqldf("select pwgtp1 from acs where AGEP < 50")


##Q3
sqldf("select distinct AGEP from acs")

##Q4
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
##sapply(htmlCode[c(10, 20, 30, 100)], nchar)
nchar(htmlCode[c(10, 20, 30, 100)])

##Q5
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl,destfile = "./numbers1.for", method="curl")

data <- read.fwf("numbers.for", skip = 4, widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),col.names=c("Week", "Nino12SST", "Nino12SSTA", "Nino3SST", "Nino3SSTA", "Nino34SST", "Nino34SSTA", "Nino4SST", "Nino4SSTA"))

sum(data[,4])
