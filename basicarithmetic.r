#Authur: Maureen Waitherero Wachira ;  
#For: R-BASICS SERIES
#Date: 3rd October 2016



#******************Setting up working directory*****************************
#***********************************************************

# character indicates a comment

getwd() # find current working directory

setwd("~/Documents/R-Analytics") # set working directory


#****************** Basic arithmetic in R****************************
#********************************************************************  

#Assign a value to a variable in R
x <- 4
y <- 9

#addition
x+y

#subtraction
x-y

#multiply
x*y

#divide
x/y

# square
x^2

#squareroot
x^(1/2) #or 
sqrt(x)

#natural log
log(x)

#exponetnt
exp(x)

#logbase2
log2(x)

#******************create vector*****************************

#When given two vectors of the same length, R simply performs the specified arithmetic
#operation (`+`, `-`, `*`, etc.) element-by-element. If the vectors are of different
# lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.
#Any object that contains data is called a data structure and numeric vectors are the simplest type of data
#structure in R.

v1<-c(12,10.8,77,90.8)  #c() is to concatenate
v2 <- rep("moh",time=4) #vector of repeated character 'moh' 4 times
v3 <- rep(1:3,time=3)   #vector of repeated numbers 1-3 ,3 times also can be written as below ;
v3 <- rep(c(1:3),3)
v4<- rep(c("moh, stem"),time=2)

#******************create sequence*****************************

sequence1<-1:9 #sequence running from 1 to 9 by 1;Note that the : operator is used to create integer sequences
#OR
seq(from=1,to=9,by=1)
sequence2 <- seq(from=1,to=50,by=1.5)#sequence running from 1 to 50 by 1.5


#******************subset vector*****************************

v1[1]#extact first element of vector v1
v1[1:3]#extract first three elements of vector v1
v1[-1]#extact all elements except the first of vector v1
v1[c(1,2)] #extact first and second element of vector v1
v1[-c(1,2)] #extact all elements except first and second element of vector v1
v1[v1<50] #extact all elements  in vector v1 that are less than 50

#******************Implicit & explicit coercion*****************************

#coercion conversion of a value into another of a different data type
#When different objects are mixed in a vector,implicit coercion occurs so that every element in the vector is of the same class.
y <- c(1.7, "a")   ## character
y <- c(TRUE, 2)    ## numeric
y <- c("a", TRUE)  ## character

#Objects can be explicitly coerced from one class to another using the as.* functions
x <- 0:6
class(x)
as.numeric(x)#coerce to numeric(real number)
as.logical(x) #logical vector(True/False)
as.character(x) #character vector
as.complex(x) # complex vector
as.integer(x)#coerce to integer

#****************** Factors ****************************

#Factors are used to represent categorical data and can be unordered or ordered. 
#The order of the levels of a factor can be set using the levels argument to factor(). 
#This can be important in linear modelling because the first level is used as the baseline level. 
#This feature can also be used to customize order in plots that include factors, since by default factors are plotted in the order of their levels.

gender <-c("male","female","male","female","male","female")
Gender <- factor(gender,levels = c("male","female"))# set male as the first level/baseline.
unclass(Gender)

#Factors in practice
age<-rep(c(1,2),10)# create a vector age that repeats the combination 1,2 ten times.

age<- as.factor(age) # change age class to a factor from numeric.

str(age) # check structure of age. 

marks <- c(20,33,45,47,48,36,57,61,15,89) # create a vector marks

cut.points <- cut(marks, breaks =c(0,40,50,60,70,100))# create levels btwn 0-100

levels(cut.points) <- c("E","D", "C","B","A") # label above levels

table(cut.points) #summary of marks

cut.points <-cut(marks, breaks =c(0,40,100))# create 2levels btwn 0-100 i.e 0-40 & 40-100

levels(cut.points) <-c("Fail","Pass")


#******************Missing values ****************************

#Missing values are denoted by NA or NaN for undefined mathematical operations.

#Testing for Missing Values
is.nan(x) # return a logical vector indicating which elements are NaN
is.na(x) # # return a logical vector indicating which elements are Na
y <- c(1,2,3,NA)
is.na(y) # returns a vector (F F F T)

#Excluding Mising Values from Analyses
y <- c(1,2,3,NA)
mean(y) # returns NA
mean(y, na.rm=TRUE) # returns 2

# list rows of dataframe e.g mydata that have missing values 
mydata<- data
mydata[!complete.cases(mydata),]# list rows of dataframe e.g mydata that have missing values

#na.omit() returns the object e.g dataframe with listwise deletion of missing values.
newdata <- na.omit(mydata)# create new dataset without missing data 

#******************create a matrix*****************************

#Matrices are vectors with a dimension attribute. 
#The dimension attribute is itself an integer vector of length 2 (number of rows, number of columns)

#Matrices are constructed column-wise, so entries can be thought of 
#starting in the “upper left”corner and running down the columns.
v1<-c(12,10.8,77,90.8,4,6,7,8,5,2) 
m <-matrix(v1,nrow = 2,ncol = 5)
matrix1 <- matrix(v1, nrow=2,byrow=T)# create a matrix of v1 vector with two rows filled in rowise(byrow=T)

dim(matrix1) # check dimesions of matrix1

dim(matrix1) <- c(2, 5)# change dimension of matrix1

#Matrices created by column-binding or row-binding with the cbind() and rbind() functions
x1 <- 1:3
y1 <- 10:12
matrix2 <- cbind(x1, y1)
matrix3 <- rbind(x1, y1)

# ******* subsetting and extraction in a matrix *****
matrix1[1,2] #extract element in row one column 2
matrix1[c(1,2),2]#extract elements in row 1 column 2 and in row 2 column 2
matrix1[,1] #extract column 0ne
matrix1[2,]# extarct row two

#***** manipulations *****

matrixT <-t(matrix1);matrixT # matrix1 transpose
matrixSQD <- matrixT%*%matrix1;matrixSQD # multiply two matrix i.e matrixT and matrix1
matrixSQ <- solve(matrixSQD);matrixSQ # matrixSQD Inverse i.e use solve() to find inverse of a matrix

#******************create a lists***************************

#Lists are a special type of vector that can contain elements of different classes.
x <- list(1, "a", TRUE, 1 + 4i);x

#We can also create an empty list of a prespecified length with the vector() function
w <- vector("list", length = 5);w

#******************create a dataframe****************************

# vectors have to be of the same length
n = c(2, 3, 5) 
s = c("aa", "bb", "cc") 
b = c(TRUE, FALSE, TRUE)

df<-data.frame(n,s,b) # created a dataframe df from vectors n,s and b.

#Data frames can be converted to a matrix by calling data.matrix()
datamatrix <- data.matrix(data)


#HOPE YOU LEARNT ALOT NOW CHECK OUT THE NEXT SCRIPT TO LEARN
#HOW TO IMPORT DATASETS IN DIFFERENT FORMATS AND ALSO EXPORT DATASETS:)
