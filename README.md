# Getting-and-Cleaning-Data-Course-Project
STUDY DESIGN
============
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 


SOURCE
------
The source of the RAW data can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This data was extracted into cloudfront.net for this coursera class located at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset included the following data files:

* 'features.txt': List of all features.

* 'activity_labels.txt': List of class labels and their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'train/subject_train.txt': ID's of subjects in the training data

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'test/subject_test.txt': ID's of subjects in the training data


EXCLUSIONS
----------
It was excluded the folowing files due it were not necessary to calculate the mean.
* **Inertial Signals** - is the raw data before the initial consolidation, it wasn't
required to calculate our means

* columns from *X_train.txt* and *X_test.txt* that did not include the mean() or
std() values.


DETAILED PROGRAMMING PROCEEDURE
-------------------------------
All procedures to clean and orginize the dataset is described in detais in the script run_analysis.r


CODE BOOK
=========

VARIABLES
---------

The data contains the mean of 3-axial linear acceleration and 3-axial angular velocities
at a constant rate of 50Hz as derived from a Samsung Galaxy S smartphone worn on the hip
during different activities by 30 volunteers.

SUMMARY CHOICES
---------------

The data excluded everything but the mean or standard deviation columns which resulted
in the following (66) row.names:

* "activity_id"                          
* "activity_name"                       
* "subject_id"                           
* "tBodyAcc-mean()-X"                   
* "tBodyAcc-mean()-Y"                    
* "tBodyAcc-mean()-Z"                   
* "tGravityAcc-mean()-X"                 
* "tGravityAcc-mean()-Y"                
* "tGravityAcc-mean()-Z"                 
* "tBodyAccJerk-mean()-X"               
* "tBodyAccJerk-mean()-Y"                
* "tBodyAccJerk-mean()-Z"               
* "tBodyGyro-mean()-X"                   
* "tBodyGyro-mean()-Y" 
* "tBodyGyro-mean()-Z"                   
* "tBodyGyroJerk-mean()-X"              
* "tBodyGyroJerk-mean()-Y"               
* "tBodyGyroJerk-mean()-Z"              
* "tBodyAccMag-mean()"                   
* "tGravityAccMag-mean()"               
* "tBodyAccJerkMag-mean()"               
* "tBodyGyroMag-mean()"                 
*  "tBodyGyroJerkMag-mean()"              
* "fBodyAcc-mean()-X"                   
*  "fBodyAcc-mean()-Y"                    
* "fBodyAcc-mean()-Z"                   
*  "fBodyAcc-meanFreq()-X"                
* "fBodyAcc-meanFreq()-Y"               
* "fBodyAcc-meanFreq()-Z"                
* "fBodyAccJerk-mean()-X"               
*  "fBodyAccJerk-mean()-Y"               
* "fBodyAccJerk-mean()-Z"               
*  "fBodyAccJerk-meanFreq()-X"            
* "fBodyAccJerk-meanFreq()-Y"           
*  "fBodyAccJerk-meanFreq()-Z"            
* "fBodyGyro-mean()-X"                  
*  "fBodyGyro-mean()-Y"                   
* "fBodyGyro-mean()-Z"                  
*  "fBodyGyro-meanFreq()-X"               
* "fBodyGyro-meanFreq()-Y"              
*  "fBodyGyro-meanFreq()-Z"              
* "fBodyAccMag-mean()"                  
* "fBodyAccMag-meanFreq()"              
* "fBodyBodyAccJerkMag-mean()"          
*  "fBodyBodyAccJerkMag-meanFreq()"       
* "fBodyBodyGyroMag-mean()"             
*  "fBodyBodyGyroMag-meanFreq()"          
* "fBodyBodyGyroJerkMag-mean()"         
*  "fBodyBodyGyroJerkMag-meanFreq()"      
* "angle(tBodyAccMean,gravity)"         
*  "angle(tBodyAccJerkMean),gravityMean)" 
* "angle(tBodyGyroMean,gravityMean)"    
*  "angle(tBodyGyroJerkMean,gravityMean)" 
* "angle(X,gravityMean)"                
*  "angle(Y,gravityMean)"                 
* "angle(Z,gravityMean)"                
*  "tBodyAcc-std()-X"                     
* "tBodyAcc-std()-Y"                    
*  "tBodyAcc-std()-Z"                     
* "tGravityAcc-std()-X"                 
*  "tGravityAcc-std()-Y"                  
* "tGravityAcc-std()-Z"                 
*  "tBodyAccJerk-std()-X"                 
* "tBodyAccJerk-std()-Y"                
*  "tBodyAccJerk-std()-Z"                 
* "tBodyGyro-std()-X"                   
*  "tBodyGyro-std()-Y"                    
* "tBodyGyro-std()-Z"                   
*  "tBodyGyroJerk-std()-X"                
* "tBodyGyroJerk-std()-Y"               
*  "tBodyGyroJerk-std()-Z"                
* "tBodyAccMag-std()"                   
*  "tGravityAccMag-std()"                 
* "tBodyAccJerkMag-std()"               
*  "tBodyGyroMag-std()"                   
* "tBodyGyroJerkMag-std()"              
*  "fBodyAcc-std()-X"                     
* "fBodyAcc-std()-Y"                    
*  "fBodyAcc-std()-Z"                     
* "fBodyAccJerk-std()-X"                
*  "fBodyAccJerk-std()-Y"                 
* "fBodyAccJerk-std()-Z"                
*  "fBodyGyro-std()-X"                    
* "fBodyGyro-std()-Y"                   
*  "fBodyGyro-std()-Z"                    
* "fBodyAccMag-std()"                   
*  "fBodyBodyAccJerkMag-std()"           
* "fBodyBodyGyroMag-std()"              
*  "fBodyBodyGyroJerkMag-std()" 

This was further broken down by subject (of which there were 30) and
activity (6) which consisted of:

* WALKING
* WALKING UPSTAIRS
* WALKING DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Resulting in a total of 180 (30*6) columns.
30 Volunteers with 6 activities each.


RESULTING DATASET
-----------------

One time.frame is returned with...

* Each Column is a measure of one Subject.Activity pair
* Each Observation is contained on it's own row
* Header Row Contains the Column names
* Variable Names are Human Readable


