## Coursera Data Science track, Johns Hopkins U
## Getting and Cleaning Data course project
## Author: Scott Loseke
## The purpose of this script is to explore the data, see what's there.

cat("\014")           ## Clear the Console
rm(list=ls())         ## Clear the data Environment
library(plyr)         ## Load library plyr

## Explore the high level data  root: C:\rProjects\c3Project

setwd("C:/rProjects/c3Project")
getwd()
list.files(path = "C:/rProjects/c3Project/data", pattern = "*.txt")

features <- read.table("./data/features.txt", stringsAsFactors = FALSE)
#head(features)
#tail(features)
str(features)
count(features$V2)
x <- grep("-mean()", features$V2, fixed = TRUE)
y <- grep("-std()", features$V2)

labels <- read.table("./data/activity_labels.txt")
head(labels)
str(labels)

## Explore the test data

list.files(path = "C:/rProjects/c3Project/data/test", pattern = "*.txt")

subject_test <- read.table("./data/test/subject_test.txt")
head(subject_test)
str(subject_test)
count(subject_test$V1)

x_test <- read.table("./data/test/X_test.txt")
str(x_test)

y_test <- read.table("./data/test/y_test.txt")
str(y_test)
head(y_test)
count(y_test$V1)


## list.files did not work with "./data/ format, so set specific working directory
setwd('C:/rProjects/c3Project/data/test/Inertial Signals')
list.files(pattern = "*.txt")

testIS <- list.files(pattern = "*.txt")
tempfn <- testIS

for (i in 1:length(testIS)) { tempfn[i] <- sub(".txt","",tempfn[i])
assign(tempfn[i], read.table(testIS[i])) }
rm(testIS, tempfn, i)

## reset path to higher level
setwd("C:/rProjects/c3Project")

## Explore the training data

list.files(path = "C:/rProjects/c3Project/data/train", pattern = "*.txt")

subject_train <- read.table("./data/train/subject_train.txt")
str(subject_train)
count(subject_train$V1)

x_train <- read.table("./data/train/X_train.txt")
str(x_train)

y_train <- read.table("./data/train/y_train.txt")
head(y_train)
count(y_train$V1)

## list.files did not work with "./data/ format, so set specific working directory
setwd('C:/rProjects/c3Project/data/train/Inertial Signals')
list.files(pattern = "*.txt")

trainIS <- list.files(pattern = "*.txt")
tempfn <- trainIS

for (i in 1:length(trainIS)) { tempfn[i] <- sub(".txt","",tempfn[i])
                               assign(tempfn[i], read.table(trainIS[i])) }
rm(trainIS, tempfn, i)
     
     



