
###Files in this repository:
=========================
 
* a tidy dataset called "dataMean.txt",
* a R script called "run_analysis.R",
* a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called "CodeBook.md",
* a ReadMe.md explains how all of the scripts work and how they are connected.

###How to run the R script "run_analysis.R",
========================================

1), Put the "run_analysis.R" file in the dataset folder/directory called "UCI_HAR_Dataset";
2), type command: source "run_analysis.R".

###This R script works as follows:
==============================
 
1), Read in the "feature.txt" in the "UCI HAR Dataset" folder/directory as the variable/column names;
2), Read in the "y_train.txt" "subject_train.txt" files in the train directory/folder; "y_test.txt" "subject_test.txt" files in the test/directory files as the observation labels for the dataset: subjects 1-30 and activity 1-6 numbers corresponding to each activity described in "activity_labels.txt";
3), Read in the "X_train.txt" from train folder/directory and "X_test.txt" datasets from test folder/directory;
4), Label the train and test data sets with descriptive variable(column)names;
5), Column bind the subject and activity observation labels to the train and test datasets
6), Change the activity numbers to descriptive activity names in the data set;
7), Extracts only the measurements on the mean and standard deviation for each measurement.  
8), Merges the training and the test sets to create one data set;  
9), Creates a second, independent tidy data set called "dataMean.txt" with the average of each variable for each activity and subject.

###The dataset folder/directory "UCI_HAR_Dataset" includes the following files:
============================================================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

