## clear work space
rm(list = ls())

## set working directory
setwd("~/Desktop/Coursera R")
path <- file.path("~/Desktop/Coursera R" , "UCI HAR Dataset")

## Read the Activity files
dataActivityTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)

## Read the Subject files
dataSubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)

## Read Fearures files
dataFeaturesTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)

## Part 1. Merges the training and the test sets to create one data set.
## row combine
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

## Set names to variables
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

## column combine
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)


## Part 2. Extracts only the measurements on the mean and standard deviation for each measurement
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

## Part.3 Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
Data$activity <- factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
Data$subject <- as.factor(Data$subject)

## Part.4 Appropriately labels the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

## Part 5. Creates a second, independent tidy data set
library(dplyr)
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
