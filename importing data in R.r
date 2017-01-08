#Authur: Maureen Waitherero Wachira
#For:Read tabular data into R and read in web data via web scraping tools and APIs
#Date: 17th October 2016

#******************Setting up working directory*****************************
#***********************************************************

getwd() # find current working directory

list.files() # command returns a character vector of filenames in the current directory (by default)

setwd("~/Documents/R-Analytics/Data") # set working directory

#******************import data*****************************
#***********************************************************

#load using file.choose() 

csvdata <- read.csv(file.choose(),header = TRUE) #header = T, implies that first row are variable names
txtdata <- read.delim(file.choose(),header = TRUE) #tab delimited data 

#load using file.choose() and read.table()

csvdata <-read.table(file.choose(),header = T, sep = ",") #csv data
txtdata <- read.table(file.choose(), header = T, sep="\t") #tab delimited data 

#******************Read tabular data into R using readr package*****************************

#The readr package includes a variety of functions in the read_* family that allow you to
#read in data from different formats of flat files.

#read_csv2 -Reads semicolon-separated file
#read_tsv - Reads tab-separated file
#read_delim-General function for reading delimited files
#read_fwf - Reads fixed width files
#read_log - Reads log files

library(readr)
data <- read_csv("gasdata.csv");data#read_csv - Read_log Reads comma-separated file

#Note that the message (“Parse with column specification ...”) printed after the call indicates
#that read_csv may have had some difficulty identifying the type of each column. This can be
#solved by using the col_types argument.


#**********Import online Flat files **********

#To fit the long web address comfortably in an R script window, you can use the
#paste0() function to paste pieces of the web address together:

ext_tracks_file <- paste0("http://rammb.cira.colostate.edu/research/",
                          "tropical_cyclones/tc_extended_best_track_dataset/",
                          "data/ebtrk_atlc_1988_2015.txt")



#******************Requesting data through a web API*****************************

#As an overview, the basic steps for accessing and using data from a web API when working
#in R are:

  #•Figure out the API rules for HTTP requests
  #•Write R code to create a request in the proper format
  #•Send the request using GET or POST HTTP methods
  #•Once you get back data from the request, parse it into an easier-to-use format if necessary.



#Examples of existing R packages to interact with open data APIs include:
  #•twitteR : Twitter

#***retrieve tweets from Twitter***
library(twitteR)
library(ROAuth)
# Twitter authentication

# Go to http://dev.twitter.com/apps/new to create an app and get values
# for below credentials, which you'll need to provide in place of these
# empty string values that are defined as placeholders.


consumer_key <- 	  "insert consumer_key "
consumer_secret <- 	"insert consumer_secret"
access_token <-     "insert access_token"
access_secret <- 	  "insert access_secret"


setup_twitter_oauth(consumer_key, consumer_secret, access_token,
                    access_secret)

# retrieve tweets

tweets <- searchTwitter("Data Science OR Machine learning OR 'Artificial inteligence", n=100, lang="en", since="2014-08-20")

# Transform tweets list into a data frame
tweets.df <- twListToDF(tweets)

#Exercise use
#•RGoogleAnalytics : Google Analytics

#******************Scraping web data*****************************
#use rvest package to pull in the full web page file (often in HTML or XML) and then parse or clean it within R.
# RESEARCH MORE ON PARSING JSON AND XML DATA TYPES TO LISTS IN R!

#Example of getting data fro Nairobi traffic RESTFUL API
library(rjson)

#REST endpoint for nairobi's traffic
url <-"http://nairobitraffic-server.elasticbeanstalk.com/api/trafficRecord/"

#JSON response from rest endpoint
response <- scan(url, "", sep="\n")

#convert response from JSON to list
responseList <- fromJSON(response)

#get the results from the response
results <- responseList$results

#convert results from list to dataframe
trafficData <- do.call(rbind, lapply(results, function(input){
  #Convert a traffic object to a row
  row <- as.data.frame(input)
  return(row)
}))

#update the column names
names(trafficData) <- c("ID", "Section Name", "Traffic Rate", "Timestamp")



#****************** export data*****************************
write.table(datax, file ="datax.txt", append=F, sep="/t") # exported as datax.txt

