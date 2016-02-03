##1
## URL for download
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

## Downloadig file
download.file(fileUrl, destfile="./quizd.csv", method ="curl")

## assigning data table to variable
fileData <- read.table("quizd.csv", sep=",", header=TRUE)
fff<-fread("./quizd.csv")

## Property cost more than $1,000,000
 ## Val =24
##1
data <- fff[, .N, by = VAL]
data[VAL==24][[2]]

##2
ans1<-fileData$VAL[complete.cases(fileData$VAL)]
sum(ans1==24)
 
##Q2
fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

download.file(fileUrl2, destfile="./quizd3.xlsx", method ="curl")

colIndex<-7:15
rowIndex<-18:23
dat<-read.xlsx("./quizd3.xlsx",sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

##Q3
fileUrl3<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl3, destfile="./quizd4.xml", method ="curl")
doc<-xmlTreeParse("./quizd4.xml", useInternal=TRUE)

rootNode <- xmlRoot(doc)
zips<-xpathSApply(rootNode,"//zipcode",xmlValue)
length(zips[zips==21231])

##Q5

fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl4, destfile="./quizd5.csv", method ="curl")
DT<-fread("./quizd5.csv")
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])
