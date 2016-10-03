#Authur: Maureen Waitherero Wachira
#For:R basics
#Date: 3rd October 2016

#******************Setting up working directory*****************************
#***********************************************************

getwd() # find current working directory

setwd("~/Documents/R-Analytics") # set working directory


#******************import data*****************************
#***********************************************************


#******************save work space *****************************
#***********************************************************
save.image("basics.Rdata") # this will be saved in current working directory


#******************load work space *****************************
#***********************************************************

load("basics.Rdata")

#or use file.choose()command

load(file.choose())

