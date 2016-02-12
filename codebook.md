# Data feature
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Reading Data
1. Set working directory  
2. Read the activities files y_test.txt and y_train.txt
3. Read the Subject files subject_train.txt and subject_test.txt
4. Read Fearures files x_train.txt and x_test.txt

# Part 1. Merge the training and the test sets to create one data set.
1. Combine the DATA training and test files
2. Set names to variables
3. Combine the columns to create one data set

# Part 2. Extract only the measurements on the mean and standard deviation for each measurement.
1. Subset Name of Features by measurements on the mean and standard deviation
2. Subset the Data by seleted names of Features

# Part 3. Use descriptive activity names to name the activities in the data set
1. Read descriptive activity names from “activity_labels.txt”
2. Facorize Variale activity and Subject

# Part 4. Appropriately label the data set with descriptive activity names.
1.Use gsub function for pattern replacement to clean up the data labels.

# Part 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
1.Use dplyr package to creat a tidy data
2.Output the data
