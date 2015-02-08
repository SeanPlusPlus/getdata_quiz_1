# Question 5
# The American Community Survey distributes downloadable data about United States
# communities. Download the 2006 microdata survey about housing for the state of
# Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# using the fread() command load the data into an R object
# DT
# Which of the following is the fastest way to calculate the average value of the variable
# pwgtp15
# broken down by sex using the data.table package?

################################################################################
getHousingData <- function() {
################################################################################

  # add data dir
  if(!file.exists("data")) {
    dir.create("data")
  }

  # fetch and return
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileUrl, destfile = "./data/community2006.csv", method = "curl")
  data <- read.csv("./data/community2006.csv")
  return(data)
}

################################################################################
main <- function() {
################################################################################
  data <- getHousingData()
}
