#Authur: Maureen Waitherero Wachira
#For:Read tabular data into R and read in web data via web scraping tools and APIs
#Date: 17th October 2016

#******************Setting up working directory*****************************
#***********************************************************

getwd() # find current working directory

list.files() # command returns a character vector of filenames in the current directory (by default)

setwd("~/Documents/R-Analytics") # set working directory

#******************Read tabular data into R using readr package*****************************

#The readr package includes a variety of functions in the read_* family that allow you to
#read in data from different formats of flat files.

#read_csv - Read_log Reads comma-separated file
#read_csv2 -Reads semicolon-separated file
#read_tsv - Reads tab-separated file
#read_delim-General function for reading delimited files
#read_fwf - Reads fixed width files
#read_log - Reads log files

library(readr)
data <- read_csv("data.csv")

#******************Read in web data via web scraping tools and APIs*****************************

#To fit the long web address comfortably in an R script window, you can use the
#paste0 function to paste pieces of the web address together:

ext_tracks_file <- paste0("http://rammb.cira.colostate.edu/research/",
                          "tropical_cyclones/tc_extended_best_track_dataset/",
                          "data/ebtrk_atlc_1988_2015.txt")


#ABOVE IS NOT COMPLETE!!!!!

#******************Requesting data through a web API*****************************

#As an overview, the basic steps for accessing and using data from a web API when working
#in R are:

  #•Figure out the API rules for HTTP requests
  #•Write R code to create a request in the proper format
  #•Send the request using GET or POST HTTP methods
  #•Once you get back data from the request, parse it into an easier-to-use format if necessary.

#Examples of existing R packages to interact with open data APIs include:
  #•twitteR : Twitter
  #•RGoogleAnalytics : Google Analytics


#******************Scraping web data*****************************
#pull in the full web page file (often in HTML or XML) and then parse or clean it within R.
