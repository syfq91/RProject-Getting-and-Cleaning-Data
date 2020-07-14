# Course_Project
Peer-graded Assignment: Getting and Cleaning Data Course Project

## Background
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data processing in the script 

The script run_analysis.R does the following:

### 0.Download the Raw data
Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it

Read the train dataset and test dataset:

x_train: the 561 variables of 7352 subjects.

x_test: the 561 variables of 2947 subjects.

y_train: the activity label of 7352 subjects.

y_test: the activity label of 2947 subjects.

sub_train: the identifier of the subject who carried out the experiment in train dataset (n=7352).

sub_test: the identifier of the subject who carried out the experiment in test dataset (n=2947).

### 1.Merges the training and the test sets to create one data set.
Name the variables in x according the features.txt. 

Give the colname to y and sub.

Merge all the data into dataset.

### 2.Extracts only the measurements on the mean and standard deviation for each measurement.
Extract the colname contain "mean" and "std" from x dataset.

### 3.Uses descriptive activity names to name the activities in the data set
Describe the activity according activity_labels.txt.

### 4.Appropriately labels the data set with descriptive variable names.
Change the colname of dataset according features_info.txt

### 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Group the data according subject and activity, then summary the average.

And save the tidy data as tidy_dataset.txt


## Final submission
tidy_dataset.txt: The final tidy data set.

run_analysis.R: R script for data processing.

codebook.md: The code book describes the variables
