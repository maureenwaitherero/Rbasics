#Authur: Maureen Waitherero Wachira
#For:R basics
#Date: 3rd October 2016

#******************Setting up working directory*****************************
#***********************************************************

getwd() # find current working directory

setwd("~/Documents/R-Analytics") # set working directory


#******************import data*****************************
#***********************************************************

#load using file.choose() 

csvdata <- read.csv(file.choose(),header = TRUE) #header = T, implies that first row are variable names
txtdata <- read.delim(file.choose(),header = TRUE) 

#load using file.choose() and read.table()

csvdata <-read.table(file.choose(),header = T, sep = ",") #csv data
txtdata <- read.table(file.choose(), header = T, sep="\t") #tabdelimited data 

#******************save work space *****************************
#***********************************************************
save.image("basics.Rdata") # this will be saved in current working directory


#******************load work space *****************************
#***********************************************************

load("basics.Rdata")
#or use file.choose()command
load(file.choose())

