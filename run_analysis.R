rm(list=ls())

#Download the file and unzip
file.link<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.link,destfile = "Dataset.zip",method = "curl")
unzip("Dataset.zip")

#Read the train and test dataset
list.files()

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


dim(x_train)
dim(x_test)

dim(y_train)
dim(y_test)

dim(sub_train)
dim(sub_test)

#1.Merges the training and the test sets to create one data set.

x_train <- tbl_df(x_train)
x_test <- tbl_df(x_test)

y_train <- tbl_df(y_train)
y_test <- tbl_df(y_test)

sub_train <- tbl_df(sub_train)
sub_test <- tbl_df(sub_test)

x_dataset <- bind_rows(x_train, x_test)
features <- read.table("UCI HAR Dataset/features.txt")
colnames(x_dataset) <- features$V2

y_dataset <- bind_rows(y_train, y_test)
colnames(y_dataset) <- "labels"

sub_database <- bind_rows(sub_train, sub_test)
colnames(sub_database) <- "subject"

dataset <- cbind(sub_database, x_dataset, y_dataset)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

dataset.select <- dataset %>% select("subject","labels",contains("mean"), contains("std"))

#3. Uses descriptive activity names to name the activities in the data set

activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
dataset.select$activity <- activity_label[dataset.select$labels, 2]

#4. Appropriately labels the data set with descriptive variable names.
colnames(dataset.select) <- colnames(dataset.select) %>%
        gsub("Acc", " Accelerometer", .) %>%
        gsub("Gyro", " Gyroscope", .) %>%
        gsub("^t", "Time ", .) %>%
        gsub("Jerk", " Jerk", .) %>%
        gsub("Mag", " Magnitude", .) %>%
        gsub("^f", "Frequency ", .) %>%
        gsub("meanFreq\\(\\)", "mean frequency", .) %>%
        gsub("\\(\\)", "", .) 

colnames(dataset.select)[2] <- "activity_labels"
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_dataset <- dataset.select %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(x = tidy_dataset, file = "tidy_dataset.txt", row.names = FALSE)
