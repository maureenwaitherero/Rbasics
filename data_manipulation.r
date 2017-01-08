#Authur: Maureen Waitherero Wachira
#For:Data manipulation in R
#Date: 25rd October 2016

#******************Data manipulation*****************************
#***********************************************************

#The learning objectives for this script is to:
  # • Transform non-tidy data into tidy data
  # • Manipulate and transform a variety of data types, including dates, times, and text data


#****Tidy dataset ****

#Tidy dataset has the following properties:
#Each variable forms a column.
#Each observation forms a row.
#Each type of observational unit forms a table.

library(tidyr)
library(dplyr)

#dplyr crash course
male <- filter(data, Gender== "male") #using filter() dplyr function to filter dataset based on gender

#******************Piping*****************************
#What is piping and why is it iportant