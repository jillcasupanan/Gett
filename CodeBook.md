## Code Book

This code book summarizes the resulting data fields in secondTidySet.txt

## About the R script
run_analysis.R contains the code to perform the analysis described in the Peer-graded Coursera Project (Item 1 to item 5).
Item 1 merges the training and test sets to create one (1) data set.
Test and training tables were read and also the features and activityLabels.
In item 1, column name was assigned and then the data were merged using rbind.

Item 2 extracts only the measurements on the mean and standard deviation for each measurement.
In here, the column name was read and the vector for defining the ID, mean and standard devition was created.
Then the essential subset for merger was also created.

Item 3 uses descriptive activity names to name the activities in the data set.

Item 4 appropriately labels the data set with descriptive variable names.

Item 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Making and writing the second tidy data set was done here.

## About the variables
x_train, y_train, x_test, y_test, subject_train and subject_test contains the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names that are stored

