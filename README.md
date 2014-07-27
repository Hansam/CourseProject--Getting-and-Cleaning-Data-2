##Introduction##

###The here provided dataset originated from a the 'Getting and Cleaning data' Coursera course which is part if the Data Science Specialisation. 
### The raw data used to compile the present data set TidyDataSet2.txt has been collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out to develop advanced algorithms. A group of 30 volunteers within an age bracket of 19-48 years person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

##Description: Getting and Cleaning Data Course Project##

### The original raw data contained a pre-processed data set that was partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. These two data sets were used to further summarise the experiments. For this the following files were merged together into one data frame.

### Common files of the train and test data set:
### activity_labels.txt
### features.txt
### Train data set files
### subject_train.txt
### X_train.txt
### y_train.txt
### Test data set files
### subject_test.txt
### X_test.txt
### y_test.txt

### The files were merged into one data set as follows. Initially, to each data set, X_train.txt and X_test, a column called 'Partition' was added and filled with train and test, respectively.  Further, the features.txt fie was used as column names for X_train/X_test.txt, whereas subject_train/subject_test.txt and Y_train/Y_test.txt were added to X_train/X_Xtest.txt as addtional columns with the header 'Subject' and 'Activity' respectively. The numbers 1 to 6 in the 'Activity' column were replaced with the equivalent names in activity_labels.txt of each activity and the column was labelled 'Activity_Names'.
### Next, only the measurements on the mean and standard deviation for each measurement were extracted.
### The column names of the means and standard deviations that originated from the features.txt were edited, so that no parentheses or dashes were incuded in the names any more. This way, these special characters would not interfere with the syntax of R. To obtain a narrow and long table instead of a wide, but shorter table (I prefer narrow long tables) the mean and standard deviation variables (column names) were 'melted' into one column with the name 'Measurement_Type', the corresponding values were 'melted' into second column 'Measurement_Value'. This now tidy table (5 columns and 679734 rows) was saved as TidyDataSet1.csv. 

### A second, independent tidy data set with the average of each mean and standard deviation variable for each activity and each subject was calculated from the first data set and saved as TidyDataSet2.csv (5 columns and 11880 rows). A detailed description of each column of this data set can be found in the Codebook.md. The code for this project can be found in the run_analysis.R.


