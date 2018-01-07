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
the zip file "FUCI HAR Dataset.zip". The folder "UCI HAR Dataset" is: C:/rProjects/c3Project/data,
the sub-folders are the same, with folders "test" and "train" at the next level.

The script file exploration.R provides code to explore the data, see what's there and figure out
how it fits together. Understanding the dimensions of the data was vital to completing the project.

The script run_analysis.R reads, merges, subsets, and analyzes data in the main datasets
x_train.txt and x_test.txt. Each dataset contains 561 variables, the training dataset contains
7,352 observations while the test data contains 2,947.

Step 1 merges the data to create on large dataset x_full with 10299 observations and 561 variables.

Step 2 extracts only the measurements on the mean and standard deviation for each measurement.
The measurements or variable descriptions for the 561 variables in x_full can be found in features.txt. 

There are 33 variables for each mean and standard deviation, so a total of 66 X values or columns will be
extracted from the x_full dataset.

Step 3 merges the activity description and subject code numbers with the full dataset decribed above.

Step 4 labels the variables. The complete tidy dataset x_fulltidy contains 10299 observations and 68 variables.

To create this dataset we needed to trust the data in the observations dataset lined up properly with the data in
the subject and activities datasets. Steps were taken to ensure the order was preserved.

Step 5 creates the second tidy dataset
See codeBook.pdf for a full description of the variables in the final tidy dataset.

The script run_analysis.R contains further documentation.


