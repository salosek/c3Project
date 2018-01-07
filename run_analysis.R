## Coursera Data Science track, Johns Hopkins U
## Getting and Cleaning Data course project
## Author: Scott Loseke
## This script will read, merge, subset, and analyze data from the Samsung dataset.
## It produces two tidy datasets described in Steps 1 & 2, and Step 5 of the instructions.
## The tidy dataset from Step 5 can be found in the GitHub repo https://github.com/salosek/c3Project
## The additional R script exploration.R provides code to explore the data.

## preliminaries: clean up R studio
cat("\014")           ## Clear the Console
rm(list=ls())         ## Clear the data Environment

## Step 1 merges the training and test datasets to create one dataset. the README.md file describes the folder structure.

setwd("C:/rProjects/c3Project")

x_train <- read.table("./data/train/X_train.txt")

x_test <- read.table("./data/test/X_test.txt")

x_full <- rbind(x_train, x_test)


## Step 2 extacts measurements on the mean and standard deviation.
## Measurements described in the features dataset

features <- read.table("./data/features.txt", stringsAsFactors = FALSE)
## create the vector xy to reference the columns in X_full to extract the mean() and std() columns
x <- grep("-mean()", features$V2, fixed = TRUE)
y <- grep("-std()", features$V2)
xy <- c(x, y)
sort(xy)
rm(x, y)

## x_fullext extracts only the measurements on the mean and standard deviation, ext:extract
x_fullext <- x_full[,c(xy)]

## The features_ext dataset contains the descriptive variable names used to complete part of Step 4 here
features_ext <- features[c(xy),] 

names(x_fullext) <- c(features_ext$V2)

## clean things up
rm(x_train, x_test, x_full, features, features_ext, xy)
 
## Step 3 attach the subject codes (1:30) and activity labels to the dataset using descriptive activity names 

## create one vector with all the subjects

subject_train <- read.table("./data/train/subject_train.txt")

subject_test <- read.table("./data/test/subject_test.txt")

subject_full <- rbind(subject_train, subject_test)
names(subject_full) <- c("subjectCode")

x_fullext <- cbind(subject_full, x_fullext)

rm(subject_train, subject_test, subject_full)

## arrange the activity labels

y_train <- read.table("./data/train/y_train.txt")

y_test <- read.table("./data/test/y_test.txt")

y_full <- rbind(y_train, y_test)
head(y_full)
rm(y_train, y_test)

labels <- read.table("./data/activity_labels.txt")
## paste the number in front of the activity description to be anal about sort order later
## will be undone later prior to writing the final tidy dataset
labels$V2 <- paste(labels$V1, labels$V2, sep=".")
labels

## join the activity description to the activity code in y_full
## be careful to preserve the order for later merging with x_fullext
## create an order variable using dim(y_full)[1], here 10299 observations
y_full$orderNo <- c(1:dim(y_full)[1])

## use an outer join to attach the activity descriptions to y_full then reorder using orderNo
y_fulldesc <- merge(x = y_full, y = labels, by = "V1", all = TRUE)
names(y_fulldesc) <- c("activityCode", "orderNo", "activityDescription")

y_fulldesc <- y_fulldesc[with(y_fulldesc, order(orderNo)),]

## merge the activity lables and subjects to the full dataset

x_fulltidy <- cbind(y_fulldesc$activityDescription, x_fullext)
colnames(x_fulltidy)[1] <- "activityDescription"

rm(labels, y_full, y_fulldesc, x_fullext)

## sort the tidy dataset by Subject and Activity
x_fulltidy <- x_fulltidy[with(x_fulltidy, order(subjectCode,activityDescription)),]

head(x_fulltidy[, 1:3])


## Step 5 create a second tidy dataset with the average of each variable by activity and subject
library(dplyr)

meanXtidy <- x_fulltidy %>% group_by(subjectCode, activityDescription) %>% summarize_all(funs(mean))

## remove the number in front of the activity description
meanXtidy$activityDescription <- substring(meanXtidy$activityDescription, 3)

## write the tidy dataset to complete step 5 and submit
getwd()
write.table(meanXtidy, "tidyXMeans.txt", row.names = FALSE, col.names = TRUE)

## for those that like Excel
library(openxlsx)
        
write.xlsx(meanXtidy, "tidyXMeans.xlsx", row.names = FALSE)

head(meanXtidy[,1:3])

testread <- read.table("tidyXMeans.txt", header = TRUE)
