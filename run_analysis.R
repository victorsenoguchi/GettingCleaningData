#load packages

library(dplyr)
library(data.table)

# Download Dataset

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if(!file.exists(zipFile)){
    download.file(Url, zipFile, mode = "wb")
}

dataPath <- "UCI HAR Dataset"
if(!file.exists(dataPath)){
    unzip(zipFile)
}

# Load Data

## Training dataset

trainingSubjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainingValues <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainingActivity <- read.table(file.path(dataPath, "train", "y_train.txt"))

## Test dataset 

testSubjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testValues <- read.table(file.path(dataPath, "test", "X_test.txt"))
testActivity <- read.table(file.path(dataPath, "test", "y_test.txt"))

## Features

features <- read.table(file.path(dataPath, "features.txt"), 
                       as.is = TRUE,
                       col.names = c("index", "featureNames"))

## Activity labels

activities <- read.table(file.path(dataPath, "activity_labels.txt"),
                         col.names = c("activityId", "activityLabel"))

# Creating, working and cleaning data

## Merging the dataset 

humanActivity <- rbind(cbind(trainingSubjects, trainingValues, trainingActivity),
                       cbind(testSubjects, testValues, testActivity))

## Assing column names

colnames(humanActivity) <- c("subject","activity",features[, 2])

## Cleaning the new dataset 

columnsToKeep <- grepl("subject|activity|mean|std", colnames(humanActivity))
humanActivity <- humanActivity[, columnsToKeep]

## Replace activity values with named factor levels

humanActivity$activity <- factor(humanActivity$activity,
                                 levels = activities[, 1],
                                 labels = activities[, 2])

## Get column names

humanActivityCols <- colnames(humanActivity)

## Removing special characters

humanActivityCols <- gsub("[\\(\\)-]", "", humanActivityCols)

## Expand abbreviations and clean up names 

humanActivityCols <- gsub("^f", "frequencyDomain", humanActivityCols)
humanActivityCols <- gsub("^t", "timeDomain", humanActivityCols)
humanActivityCols <- gsub("Acc", "Accelerometer", humanActivityCols)
humanActivityCols <- gsub("Gyro", "Gyroscope", humanActivityCols)
humanActivityCols <- gsub("Mag", "Magnitude", humanActivityCols)
humanActivityCols <- gsub("Freq", "Frequency", humanActivityCols)
humanActivityCols <- gsub("mean", "Mean", humanActivityCols)
humanActivityCols <- gsub("std", "StandardDeviation", humanActivityCols)
humanActivityCols <- gsub("BodyBody", "Body", humanActivityCols)

## Assign new column names

colnames(humanActivity) <- humanActivityCols

## Summarie

humanActivityMeans <- humanActivity %>% 
                      group_by(subject, activity) %>%
                      summarise_each(funs(mean))

# Tidy Data
write.table(humanActivityMeans,
            "tidy_data.txt",
            row.names = FALSE, 
            quote = FALSE)
