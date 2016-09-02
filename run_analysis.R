#Data Cleaning Week 4 Assignment

library(dplyr)

setwd("C:/Users/jonho/Documents/ADS Training/Coursera/Data Cleaning")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","FUCI HAR Dataset.zip")
unzip("FUCI HAR Dataset.zip")


#1. Merge the test and training data into a single dataset

#Read in all of the relevant files
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")

#tXYZ - 40x5
#tMag - 13x5
#fXYZ - 79x3
#fMag - 13x4
#angle - 5x1

#Assign the feature names to the data sets
names(X_test) <- features[,2]
names(X_train) <- features[,2]
names(y_test) <- "ActivityIndex"
names(y_train) <- "ActivityIndex"
names(subject_test) <- "subject"
names(subject_train) <- "subject"

#Merge the X and y files (i.e. the data parameters and the activity index associates with each)
Xy_test <- cbind(subject_test,y_test,X_test)
Xy_train <- cbind(subject_train,y_train,X_train)

#Merge the test and training data sets
Xy_all <- rbind(Xy_test,Xy_train)

#########################################################################################

#2. Extract only the measurements on the mean and standard deviation for each measurement

#Extract the list of variable names from the final dataset
namelist <- names(Xy_all)

#Find all of the variables corresponsing to means and standard deviations
meanvars <- grep("mean",namelist)
stdvars <- grep("std",namelist)

#Extract the activity index and all of the mean & standard deviation measurements
Xy_all_meanstd <- cbind(Xy_all[c(1,2)],Xy_all[meanvars],Xy_all[stdvars])

#########################################################################################

#3. Assign descriptive activity names to name the activities in the data set

#Initialize the activity mapping
activityindex <- c(1:6)
activity <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing","Laying")
activitylabels <- data.frame(activityindex,activity)

#Add the activity type to each of the rows in the combined dataset
Xy_all_meanstd <- merge(activitylabels,Xy_all_meanstd,by.x = "activityindex",by.y = "ActivityIndex")

#########################################################################################

#4. Appropriately label the data set with descriptive variable names

#All of this has been taken care of in the previous steps:
#    Each of the mean and standard deviation items already has a very descriptive name as described in the code book
#    The activity columns have been renamed in the previous step to be more descriptive (i.e. "activityindex" & "activity")

#For completeness, the dataset itself is renamed here
HARFullMeanStd <- Xy_all_meanstd

#########################################################################################

#5. From the data in step 4, create a second, independent tidy data set with the average of each variable for each activity
# and each subject

#Group by the subject and activity, then extract the mean for each of the other variables
HARFullMeanStdSummary <- HARFullMeanStd %>% group_by(subject,activity) %>% summarise_each(funs(mean))
