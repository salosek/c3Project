==================================================================
# Course 3 Project, Getting and Cleaning Data, 
using the Human Activity Recognition Using Smartphones Dataset
==================================================================
Author: Scott Loseke
Nebraska Public Power District
==================================================================

This README file describes the data folder structure and code scripts used to produce
two tidy datasets necessary for completing the project.

The data folder structure contains one difference from what you get from just extracting 
the zip file FUCI HAR Dataset.zip. The folder "UCI HAR Dataset" is: C:/rProjects/c3Project/data,
the sub-folders are the same with folders "test" and "train" at the next level.

The script file exploration.R provides code to explore the data, set what's there and see
how it fits together. Understanding the dimensions of the data was vital to completing the project.

The script run_analysis.R reads, merges, subsets, and analyzes data in the main datasets
x_train.txt and x_test.txt. Each dataset contains 561 variables, the training dataset contains
7,352 observations while the test data contains 2,947.

Step 1 merges the data to create on large dataset x_full with 10299 observations and 561 variables.

Step 1 extracts only the measurements on the mean and standard deviation for each measurement.

 