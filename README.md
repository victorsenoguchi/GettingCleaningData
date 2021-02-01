# Getting and Cleaning Data Course Project

## Files: 

README.md, this file, which provides an overview of the data set and how it was created. \
tidy_data.txt, which contains the data set. \
code_book.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data). \ 
run_analysis.R, the R script that was used to create the data set (see the Creating the data set section below) \

## Data

The source data are from the Human Activity Recognition Using Smartphones Data Set. \
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones \
The data for the project:(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) \

## R script run_analysis.R

Download and unzip source data if it doesn't exist. \
Read data. \
Merge the training and the test sets to create one data set. \
Extract only the measurements on the mean and standard deviation for each measurement. \
Use descriptive activity names to name the activities in the data set. \
Appropriately label the data set with descriptive variable names. \
Create a second, independent tidy set with the average of each variable for each activity and each subject. \
Write the data set to the tidy_data.txt file. \
