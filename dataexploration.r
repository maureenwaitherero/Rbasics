#Authur: Maureen Waitherero Wachira
#For:data exploration in R
#Date: 3rd October 2016


#******************Setting up working directory*****************************
#***********************************************************

getwd() # find current working directory

setwd("~/Documents/R-Analytics") # set working directory


#******************import Read tabular data into R*****************************
#***********************************************************

#load using file.choose() 

csvdata <- read.csv(file.choose(),header = TRUE) #header = T, implies that first row are variable names


#******************Data exploration/find out what data is telling us ****************************

attach(data) # attach data make variables global variables

detach(data) # detach data (opposite of attach)

dim(data) #check no. of rows and columns in our dataset

id <- 1:725 #create object id that is a sequence from 1-725

data <- cbind(id, data) # add a colunm id to initial dataframe 'data'(order matters)

head(data) # veiw first 6 rows

tail(data) # veiw last 6 rows

Veiw(data) # veiw dataset

names(data) # veiw column names of the dataset

str(data) # check structure of the dataset

colnames(data)<- c("lungcap", "age", "height", "smoke", "gender", "caesarean") # renaming column names

mean(height) # mean of colunm height

#******************subset data****************************
data[2,5] # returns value in row 2 , column 5 

data[2:5] #3 get colunms 2 through 5 and all rows

data[2:5, ] # get rows 2 through 5 and all columns

data[ ,-1] -> data # remove first column and rename data set after



#graphs!!!!

