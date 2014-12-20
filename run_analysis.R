
## Coursera/JHU Getting and Cleaning Data
## Course Project
## Assignment
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Get required libraries
library("data.table")
library("reshape2")

## Get tables that are common to test and training data
## Read labels
message("Reading project labels")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
features_wanted <-grep("mean|std",features)

## Read and bind Test and Training Data
## TEST DATA
message("Processing Test Data")
message("     Reading data")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Apply labels to...
message("     Applying labels")
##   Activity labels in Y in a new column
y_test[,2] = activity_labels[y_test[,1]]
##   Column names in Y
names(y_test) = c("ActivityID", "ActivityDescr")
##   Column names in X
names(x_test) = features
##   Column names to Subject
names(subject_test) = "SubjectID"

## limit X to only mean and std 
message("     Getting columns wanted")
x_test_wanted<-x_test[,features_wanted]

## cbind subject+y+x data sets
message("     Binding columns together")
test_data <- cbind(as.data.table(subject_test), y_test, x_test_wanted)

## TRAINING DATA
message("Processing Training Data")
message("     Reading data")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


## Apply labels to...
message("     Applying lables")
##   Activity labels in Y in a new column
y_train[,2] = activity_labels[y_train[,1]]
##   Column names in Y
names(y_train) = c("ActivityID", "ActivityDescr")
##   Column names in X
names(x_train) = features
##   Column names to Subject
names(subject_train) = "SubjectID"

## limit X to only mean and std 
message("     Getting columns wanted")
x_train_wanted<-x_train[,features_wanted]

## cbind subject+y+x data sets
message("     Binding columns together")
train_data <- cbind(as.data.table(subject_train), y_train, x_train_wanted)

## rbind Test and Train data sets
message("Binding test and training together")
data = rbind(test_data, train_data)

## Make a tidy data set of means
## melt data high and cast wide
message("Building tidy data set")
GroupBy <- c("SubjectID", "ActivityID", "ActivityDescr")
## Col2Mean = all cols will have mean applied, except the groupby cols
Col2Mean <- setdiff(colnames(data), GroupBy)
molten <- melt(data, id = GroupBy, measure.vars = Col2Mean)
tidy <- dcast(molten, SubjectID + ActivityDescr ~ variable, mean)
write.table(tidy,"tidy.txt",row.names=FALSE)
message("Done.")
