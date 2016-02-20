## URL for download
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

## Downloadig file
download.file(fileUrl, destfile="./quizd.csv", method ="curl")

## assigning data table to variable
fileData <- read.table("quizd.csv", sep=",", header=TRUE)

##1
##LogicalVector
agricultureLogical <- fileData$ACR == 3 & fileData$AGS == 6
which(agricultureLogical)

##2
library(jpeg)
fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl2, destfile="./Fjeff.jpg", method ="curl")

photo <- readJPEG("Fjeff.jpg", native = TRUE)

##definite Quantile
quantile(photo, probs = c(0.3, 0.8))

#3
fileUrl3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
## Downloadig file
download.file(fileUrl3, destfile="./GDP.csv", method ="curl")

library(data.table)
## assigning data table to variable
GDP.Data = fread("GDP.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))

fileUrl4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
## Downloadig file
download.file(fileUrl4, destfile="./GDP_ed.csv", method ="curl")
## assigning data table to variable
GDP.edData <- fread("GDP_ed.csv")

##Merging
merged_data <- merge(GDP.Data, GDP.edData, by = "CountryCode")
nrow(merged_data)

##arranging
arrange(merged_data, desc(Rank))[13]

##4
merged_data[, mean(Rank, na.rm=TRUE), by='Income Group']

library(plyr)
merged_data<-rename(merged_data, c("Income Group" = "Income_Group"))

library(dplyr)
merged_data%>%
        select(Income_Group,Rank) %>%
        group_by(Income_Group)%>%
        summarize(mean(Rank, na.rm=TRUE))%>%
        print
##5
library(Hmisc)
merged_data$RankGroups <- cut2(merged_data$Rank, g=5)
table(merged_data$RankGroups, merged_data$Income_Group)

