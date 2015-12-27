library(plyr)
library(reshape2)


path<-getwd()

##################################################################################

# Read features 
  features<-read.table(file.path(path,"/UCI HAR Dataset/features.txt"))
  features[,2]<-as.character(features[,2])
# Extract only mean and std deviation 
  featuresrequired<-  grep("-(mean|std)\\(\\)", features[, 2])
  length(featuresrequired)
  featuresrequired.names <- features[featuresrequired,2]
# create correct colnames data
  featuresrequired.names <-gsub('-mean', 'Mean', featuresrequired.names)
  featuresrequired.names <-gsub('-std', 'Std', featuresrequired.names)
  featuresrequired.names <-gsub('[-()]', '', featuresrequired.names)
  featuresrequired.names <-gsub("^t","time",featuresrequired.names)
  featuresrequired.names <-gsub("^f","frequency",featuresrequired.names)
  featuresrequired.names <-gsub("Acc","Accelerometer",featuresrequired.names)
  featuresrequired.names <-gsub("Gyro","Gyroscope",featuresrequired.names)
  featuresrequired.names <-gsub("Mag","Magnitude",featuresrequired.names)
  featuresrequired.names <-gsub("BodyBody","Body",featuresrequired.names)
  length(featuresrequired.names)
  
#################################################################################

# read activity labels for the Training dataset into R
  training_activity_labels<-read.table(file.path(path,"/UCI HAR Dataset/train/y_train.txt"))
# read Training dataset in to R and then subset to required columns
  training_data<-read.table(file.path(path,"/UCI HAR Dataset/train/X_train.txt"))
  training_data<-subset(training_data,select=featuresrequired)
# read subject labels for the Training dataset into R
  training_subject_labels<-read.table(file.path(path,"/UCI HAR Dataset/train/subject_train.txt"))
# Combine labels & dataset for Training 
  training_combined_data<-cbind(training_subject_labels,training_activity_labels,training_data)

###################################################################################
  
# read activity labels for Test dataset into R
  test_activity_labels<-read.table(file.path(path,"/UCI HAR Dataset/test/y_test.txt"))
# read Test dataset in to R and then subset to required columns
  test_data<-read.table(file.path(path,"/UCI HAR Dataset/test/X_test.txt"))
  test_data<-subset(test_data,select=featuresrequired)
# read subject labels for Test dataset into R
  test_subject_labels<-read.table(file.path(path,"/UCI HAR Dataset/test/subject_test.txt"))
# Combine labels & datasets for Test
  test_combined_data<-cbind(test_subject_labels,test_activity_labels,test_data)
  
######################################################################################

# Combine Test and Training dataset
  complete_data<-rbind(training_combined_data,test_combined_data)
  colnames(complete_data)<-c("Subject","Activity",featuresrequired.names)
 
######################################################################################

# read activity name 
  activities<-read.table(file.path(path,"/UCI HAR Dataset/activity_labels.txt"))
  activities[,2]<- as.character(activities[,2])
# Replace activ  tail(complete_data.mean)ity name with Character value instead of numeric
  complete_data[,2]<-activities[complete_data[,2],2]
  
#######################################################################################

# Name the Columns- Step4 this gives the tidy dataset that we were looking for
  colnames(complete_data)<-c("Subject","Activity",featuresrequired.names)
  
#Create second dataset with average of each variable  each variable for each activity and each subject.
  
  complete_data.melted <- melt(complete_data, id = c("Subject", "Activity"))
  complete_data.mean <- dcast(complete_data.melted, Subject + Activity ~ variable, mean)
  
# Write dataset to the file  (Step5)
  write.table(complete_data.mean,file="tidy.txt",row.names = FALSE,quote = FALSE)
