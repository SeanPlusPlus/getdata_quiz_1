# Question 1
# The American Community Survey distributes downloadable data about United
# States communities. Download the 2006 microdata survey about housing for
# the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# How many properties are worth $1,000,000 or more?

################################################################################
getPropertyValues <- function() {
################################################################################

  data <- read.csv("getdata-data-ss06hid.csv")
  property_values <- data[,"VAL"]
  return(property_vals[!is.na(property_vals)])

}

################################################################################
main <- function() {
################################################################################

  vals <- getPropertyValues()
  print(sum(vals > 23))

}

main()
# 53
