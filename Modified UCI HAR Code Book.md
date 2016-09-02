Modified Human Activity Recognition Using Smartphones Code Book
---------------------------------------------------------------

The data covered in this document have been sources from the Human Activity Recognition Using Smartphones Dataset, v1.0, source listed below:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The data sets use a number of variables from the original dataset, a description of which are duplicated verbatim below:

---------------------------------------------------------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

---------------------------------------------------------------

The two derived datasets are detailed below:

HARFullMeanStd:
	This data set contains the mean and standard deviation of each of the variable from the full HAR dataset above
	In addition, this data set contains three additional variables:
		Subject: the individual corresponding to each measurement
		ActivityIndex: an integer from 1-6 identified corresponding to the activity in each measurement:
			1: Walking
			2: Walking Upstairs
			3: Walking Downstairs
			4: Sitting
			5: Standing
			6: Laying
		Activity: the name of the activity corresponding to the ActivityIndex, as above

HARFullMeanStdSummary:
	This data set contains the mean of each of the measurements in HARFullMeanStd above grouped by subject and activity
	In this sense, each record would be the mean and average standard deviation for each subject for each activity



