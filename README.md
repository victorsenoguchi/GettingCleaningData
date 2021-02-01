# Getting and Cleaning Data Course Project

## Introduction

In this project, the data collected from the accelerometer and gyroscope of the Samsung Galaxy S smart phone was retrieved, worked and cleaned to prepare a tidy data that can be used for later analysis. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Files

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
