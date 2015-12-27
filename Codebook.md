Code book for tidy dataset

+++++++++++++++++++++++++++++++

A bit about the data
===============================

Data for this script is collected from the accelerometers from the Samsung Galaxy S smartphone.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the script was downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 






Feature selection
=====================================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement."
To be complete, I included all variables having to do with mean or standard deviation.

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Auto regression coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt’. There are 561 features. As per the objectives of this project only Mean and std dev is selected. 

Introduction
================================================
The script run_analysis.R performs the 5 steps described in the course project's definition.

1) First,we combine create training and test dataset.
2) Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from  
   features.txt.
3) As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
4) Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called  
   averages_data.txt, and uploaded to this repository.

The tidy.txt columns reports out average of following features:

timeBodyAccelerometerMeanX
timeBodyAccelerometerMeanY
timeBodyAccelerometerMeanZ
timeBodyAccelerometerStdX
timeBodyAccelerometerStdY
timeBodyAccelerometerStdZ
timeGravityAccelerometerMeanX
timeGravityAccelerometerMeanY
timeGravityAccelerometerMeanZ
timeGravityAccelerometerStdX
timeGravityAccelerometerStdY
timeGravityAccelerometerStdZ
timeBodyAccelerometerJerkMeanX
timeBodyAccelerometerJerkMeanY
timeBodyAccelerometerJerkMeanZ
timeBodyAccelerometerJerkStdX
timeBodyAccelerometerJerkStdY
timeBodyAccelerometerJerkStdZ
timeBodyGyroscopeMeanX
timeBodyGyroscopeMeanY
timeBodyGyroscopeMeanZ
timeBodyGyroscopeStdX
timeBodyGyroscopeStdY
timeBodyGyroscopeStdZ
timeBodyGyroscopeJerkMeanX
timeBodyGyroscopeJerkMeanY
timeBodyGyroscopeJerkMeanZ
timeBodyGyroscopeJerkStdX
timeBodyGyroscopeJerkStdY
timeBodyGyroscopeJerkStdZ
timeBodyAccelerometerMagnitudeMean
timeBodyAccelerometerMagnitudeStd
timeGravityAccelerometerMagnitudeMean
timeGravityAccelerometerMagnitudeStd
timeBodyAccelerometerJerkMagnitudeMean
timeBodyAccelerometerJerkMagnitudeStd
timeBodyGyroscopeMagnitudeMean
timeBodyGyroscopeMagnitudeStd
timeBodyGyroscopeJerkMagnitudeMean
timeBodyGyroscopeJerkMagnitudeStd
frequencyBodyAccelerometerMeanX
frequencyBodyAccelerometerMeanY
frequencyBodyAccelerometerMeanZ
frequencyBodyAccelerometerStdX
frequencyBodyAccelerometerStdY
frequencyBodyAccelerometerStdZ
frequencyBodyAccelerometerJerkMeanX
frequencyBodyAccelerometerJerkMeanY
frequencyBodyAccelerometerJerkMeanZ
frequencyBodyAccelerometerJerkStdX
frequencyBodyAccelerometerJerkStdY
frequencyBodyAccelerometerJerkStdZ
frequencyBodyGyroscopeMeanX
frequencyBodyGyroscopeMeanY
frequencyBodyGyroscopeMeanZ
frequencyBodyGyroscopeStdX
frequencyBodyGyroscopeStdY
frequencyBodyGyroscopeStdZ
frequencyBodyAccelerometerMagnitudeMean
frequencyBodyAccelerometerMagnitudeStd
frequencyBodyAccelerometerJerkMagnitudeMean
frequencyBodyAccelerometerJerkMagnitudeStd
frequencyBodyGyroscopeMagnitudeMean
frequencyBodyGyroscopeMagnitudeStd
frequencyBodyGyroscopeJerkMagnitudeMean
frequencyBodyGyroscopeJerkMagnitudeStd
