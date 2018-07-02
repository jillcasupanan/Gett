#Peer-graded Assignment: Getting and CLeaning Data Course Project


library(plyr)

# Downloading of the Dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unziping the dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


####################################################################################################
# Item 1. Merging the training and test sets to create one (1) data set

## Reading the test table
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")


## Reading the training table
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")


## Reading the features list and activity labels
features <- read.table('./data/UCI HAR Dataset/features.txt')
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')


## Column name assignment
colnames(x_test) <- features [,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
    
colnames(x_train) <- features [,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(activityLabels) <-c('activityId', 'activityType')
    
## Merging the data
merge_test <- cbind(y_test, subject_test, x_test)
merge_train <- cbind(y_train, subject_train, x_train)
merger <- rbind(merge_train, merge_test)


####################################################################################################
# Item 2. Extracts only the measurements on the mean and standard deviation for each measurement

## Reading the column names of the merged file 
colNames <- colnames(merger)

## Creating vector for defining ID, mean and standard deviation:
mean_and_stdDev <- (grepl("activityId", colNames)|
                   grepl("subjectId", colNames)|
                   grepl("mean..", colNames)|
                   grepl("std..", colNames)
                 )

## Creating essential subset from merger
setMeanAndStdDev <- merger[ ,  mean_and_stdDev == T]

####################################################################################################
# Item 3. Uses descriptive activity names to name the activities in the data set
setWithActivityNames <- merge(setMeanAndStdDev, activityLabels,
                              by = 'activityId', all.x=TRUE)


####################################################################################################
# Item 4. Appropriately labels the data set with descriptive variable names
# This sted was done already in the previous steps

####################################################################################################
# Item 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
# Making second set of tidy data
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# Writing the second set of tidy data in txt file
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)






