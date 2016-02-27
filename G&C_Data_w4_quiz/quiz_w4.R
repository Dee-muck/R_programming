## URL for download
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

## Downloadig file
download.file(fileUrl, destfile="./quizd.csv", method ="curl")

## assigning data table to variable
fileData <- read.table("quizd.csv", sep=",", header=TRUE)

#1
#split names of DF by "wgtp"
splitNames<-strsplit(names(fileData),"wgtp")
splitNames[[123]]

#2

fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
## Downloadig file
download.file(fileUrl2, destfile="./GDP.csv", method ="curl")

## assigning data table to variable
GDPData <- read.table("GDP.csv", sep=",", header=TRUE)

library(data.table)
## assigning data table to variable
GDP.Data2 = fread("GDP.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))

##Calculating mean of GDP
mean(as.numeric(gsub("\\,", "", GDP.Data2$Total)), na.rm=TRUE)


#3
#Number of rows
grep("^United",GDP.Data2$Economy)

##Totals
table(grepl("^United",GDP.Data2$Economy))

#4
fileUrl3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

## Downloadig file
download.file(fileUrl3, destfile="./quizd_TS.csv", method ="curl")

## assigning data table to variable
GDP_trSet<-read.csv("quizd_TS.csv", sep=",", header=TRUE)

merged_GDP <- merge(GDP.Data2, GDP_trSet, by = "CountryCode")

##Finding FIscal year end in JUne: 
length(grep("^Fiscal year end: June", merged_GDP$Special.Notes))

#5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

byyear <- sampleTimes[format(sampleTimes,"%Y") == "2012"]
length(byyear)

monday2012 <- byyear[format(byyear, "%A") == "понедельник"]
length(monday2012)


addmargins(table(year(sampleTimes), weekdays(sampleTimes)))

