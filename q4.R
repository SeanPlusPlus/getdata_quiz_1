# Question 4
# Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# How many restaurants have zipcode 21231?

################################################################################
getRestaurants <- function() {
################################################################################
  library(XML)
  url   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  xData <- getURL(url)
  doc   <- xmlParse(xData)
}

################################################################################
main <- function() {
################################################################################
  doc <- getRestaurants()
  rootNode <- xmlRoot(doc)
  rootNode <- rootNode[[1]]

  # get zipcodes
  xpathSApply(rootNode, "//zipcode", xmlValue)
  zipCodes <- xpathSApply(rootNode, "//zipcode", xmlValue)

  # cast to data frame and get frequency
  zipCodes <- table(zipCodes)
  print(zipCodes[names(zipCodes) == "21231"])
  # 127
}
