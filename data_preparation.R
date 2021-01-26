## Data Preparation file 1


    file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    file_name <- "household_power_consumption.zip"
    download.file(file_url, file_name, method = "curl")
    
    # unzip file
    unzip(file_name)

  
  # read data  
  datajpa <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  # convert Date variable to Date class
  datajpa$Date <- as.Date(datajpa$Date, "%d/%m/%Y")
  
  # return subset data
  datajpa[datajpa$Date == "2007/02/01" | datajpa$Date == "2007/02/02", ]
  
  #Verifying info
head(datajpa)
summary(datajpa)
