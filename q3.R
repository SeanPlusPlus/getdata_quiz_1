# Question 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:
# https://d396qusza40orc.cloudatront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: dat
# What is the value of: sum(dat$Zip*dat$Ext,na.rm=T)

################################################################################
insertRow <- function(existingdat, newrow, r) {
################################################################################
  existingdat[seq(r+1,nrow(existingdat)+1),] <- existingdat[seq(r,nrow(existingdat)),]
  existingdat[r,] <- newrow
  existingdat
}

################################################################################
getGasData <- function() {
################################################################################
  install.packages("xlsx")
  library(xlsx)
  #if(!file.exists("data")){dir.create("data")}
  #fileUrl <- "https://d396qusza40orc.cloudatront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  #download.file(fileUrl, destfile = "./data/nat_gas.xlsx", method = "curl")
  gasData <- read.xlsx("./data/nat_gas.xlsx", sheetIndex = 1, header = FALSE)
  return(gasData)
}

################################################################################
main <- function() {
################################################################################
  gasData <- getGasData()
  headers <- as.vector(t(gasData[18,]))

  # create new data frame with gas data row 18 as headers
  dat     <- as.data.frame(setNames(replicate(26,numeric(0), simplify = F), headers))

  # add rows 19 through 23 of gas data to our new data frame
  for ( i in 1:5 ) {
    newrow  <- as.vector(t(gasData[(i + 18),]))
    dat[i,]  <- newrow
  }

  # get cols 7 through 15
  dat <- dat[,c(7:15)]

  # cast the Ext and Zip columns as numeric
  dat$Zip <- as.numeric(dat$Zip)
  dat$Ext <- as.numeric(dat$Ext)

  print(sum(dat$Zip*dat$Ext,na.rm=T))
}
