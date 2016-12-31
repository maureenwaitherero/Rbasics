#Authur: Maureen Waitherero Wachira ;  
#For: Crash Course on R Syntax
#Date: 3rd October 2016


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
v2 <- rep("moh",time=4) #vector of repeated word 'moh'
v3 <- rep(1:3,time=3)   #vector of repeated numbers 1-3 ,3 times also can be written as ;
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
as.numeric(x)#coerce to numeric
as.logical(x)
as.character(x)
as.complex(x)

#****************** Factors ****************************

#Factors are used to represent categorical data and can be unordered or ordered. 
#The order of the levels of a factor can be set using the levels argument to factor(). 
#This can be important in linear modelling because the first level is used as the baseline level. 
#This feature can also be used to customize order in plots that include factors, since by default factors are plotted in the order of their levels.

Gender <- factor(Gender,levels = c("male","female"))# set male as the first level/baseline.


#******************Missing values ****************************

#Missing values are denoted by NA or NaN for undefined mathematical operations.




#******************create a matrix*****************************
#Matrices are vectors with a dimension attribute. 
#The dimension attribute is itself an integer vector of length 2 (number of rows, number of columns)

matrix1 <- matrix(v1, nrow=2,byrow=T)# create a matrix of v1 vector with two rows filled in rowise(byrow=T)
matrix1[1,2] #extract element in row one column 2
matrix1[c(1,2),2]#extract elements in row 1 column 2 and in row 2 column 2
matrix1[,1] #extract column 0ne
matrix1[2,]# extarct row two


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


# 14th OCTOBER 2016 
#******************import dataset****************************

data <- read.delim(file.choose(),header = TRUE) # import txt format dataset

attach(data) # attach data make variables global variables

detach(data) # detach data 

dim(data) #check no. of rows and columns in our dataset

id <- 1:725 #create object id that is a sequence from 1-725

data <- cbind(id, data) # add a colunm id to initial data set(order matters)

head(data) # veiw first 6 rows

tail(data) # veiw last 6 rows

Veiw(data) # veiw dataset

names(data) # veiw column names of the dataset

str(data) # check structure of the dataset

colnames(data)<- c("lungcap", "age", "height", "smoke", "gender", "caesarean") # renaming column names

mean(height) # mean of colunm height

#******************subset data****************************
data[2,5] # returns value in row 2 , column 5 

data[2:5] #3 get colunms 2 throught 5 and all rows

data[2:5, ] # get rows 2 through 5 and all columns

data[ ,-1] -> data # remove first column and rename data set after

#******************generate new variables ****************************

y <- runif(725) #runif function generates real-values from the Uniform distribution

z <- rnorm(725) #rnorm function here generates 725 normal random numbers

logy <- log10(y) #log base 10 of y

ln <- ln(y) # Create vector ln which is the natural log of y 

lny <-log(y, base = exp(1)) # find what this means.....

logheight<-log10(height)

sqrtheight <- sqrt(height) 

datax<-cbind(logy,z,data,y,logheight,sqrtheight) # cbind function inserts new column(s)

#****************** export data*****************************
write.table(datax, file ="irene.txt", append=F, sep="/t") # exported as datax.txt

tapply(mwaka, gender, mean)# get the mean mwaka based on the gender(this variable is prefered to be a categorical variable)

age<-rep(c(1,2),10)# create a vector age that repeats the combination 1,2 ten times.

age<- as.factor(age) # change age class to a factor from numeric.

str(age) # check structure of age. 

marks <- c(20,33,45,47,48,36,57,61,15,89) # create a vector marks

cut.points <- cut(marks, breaks =c(0,40,50,60,70,100))# create levels btwn 0-100

levels(cut.points) <- c("E","D", "C","B","A") # label above levels

table(cut.points) #summary of marks

cut.points <-cut(marks, breaks =c(0,40,100))# create 2levels btwn 0-100 i.e 0-40 & 40-100

levels(cut.points) <-c("Fail","Pass") 


