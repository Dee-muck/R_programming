con=url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode=readLines(con)
close(con)
htmlCode

url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html<-htmlTreeParse(url,useInternalNodes=T)
xpathSApply(html,"//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

xpathSApply(html, "//td [@class='gsc_a_c']", xmlValue)  # number of citations
xpathSApply(html, "//a [@class='gsc_a_ac']", xmlValue)  # number of citations
# additional features
xpathSApply(html, "//td [@class='gsc_a_t']", xmlValue)  # article / paper title
xpathSApply(html, "//td [@class='gsc_a_y']", xmlValue)  # publication year

library(httr)
html2=GET(url)
content2=content(html2,as="text")
parsedHtml=htmlParse(content2, asText=TRUE)
xpathSApply(parsedHtml,"//title", xmlValue)

pg=GET("http://httpbin.org/basic-auth/user/passwd",
       authenticate("user","passwd"))







