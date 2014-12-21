#Code Book

##OVERVIEW
This is for the Getting and Claeaning Data course project.  Data used for this project is data collected from the accelerometers from the Samsung 
Galaxy S smartphone.  Requirements of the project include:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###From the Source Data's project authors
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The dataset includes the following files:


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


##SOURCE DATA PROVIDED
The data provided can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original source of the data is at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data is separated into two classifications: a test set (test) and a training set (training).  The structure of the test/train are the same.  For this 
project, test/train are merged together into one set to be summarized.  In test/train, data for each observation is spread across three files, therefore 
each file has the same number of lines(observations).  

The zip expands into a root of \UCI HAR Dataset\

- A list of the files provided and their content is described in the README.txt file.  
- Explainations of observation fields can be found in features_info.txt.

For readability in this Code Book, the information provided in two above files are partially listed here for clarity.  If you are interested in these details download the data and read the two above files. This Code Book provides information related to the work for this project. 




##DATA USED
###The following files were used for this projects.

**Where T=test or train  (ie: x_T can be x_test or x_train**

- subject_T.txt = subject identifier
- x_T.txt = summary statistics of each feature recorded from the smartphone.  Raw data, which was not used for this project, can be found in the ..\T\Inertial Signals\ directory
- y_T.txt = the activity taking place when data was recording.  This data was collected by review of video recording of subjects.

###Supporting data used for both the test and train data set
- activity_labels.txt = descriptors of values in y_T.txt
- features.txt = column names of values in x_T.txt


##TRANSFORMATIONS
- Column labels were added to Subject_T, x_T, and y_T data
- in y_T a column of the activity label was added (ie: 1 = Walking)
- in x_T data was filtered to just include mean and standard deviation values ()
- subject_T, y_T, and x_T were cbinded into a single data set for test and train
- The test and train data sets were Rbind into a single data set called Data
- The Data data set was melted and then dcast into a tidy data set that provides the mean of each mean and stardard deviation value

The tidy data set is provided in Tidy.txt

