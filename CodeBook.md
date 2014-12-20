#Code Book

##OVERVIEW
This is for the Getting and Claeaning Data course project.  Data used for this project is data collected from the accelerometers from the Samsung 
Galaxy S smartphone.  Requirements of the project include:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##DATA PROVIDED
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

For readability in this Code Book, the information provided in two above files are not listed here.  If you are interested in these details download the data and read the two above files. This Code Book provides information related to the work for this project. 

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
- in y_T a column of the activity label was added
- in x_T data was filtered to just include mean and standard deviation values ()
- subject_T, y_T, and x_T were cbinded into a single data set for test and train
- The test and train data sets were Rbind into a single data set called Data
- The Data data set was melted and then dcast into a tidy data set that provides the mean of each mean and stardard deviation value

The tidy data set is provided in Tidy.txt