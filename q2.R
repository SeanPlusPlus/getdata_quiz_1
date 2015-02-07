# Question 1
# Use the data you loaded from Question 1. Consider the variable FES in the code
# book. Which of the "tidy data" principles does this variable violate?


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
