# GettingAndCleaningDataProject
Run_Analysis.R R-script on Human Activity Recognition Using Smartphones Dataset


# Feature Selection


The features/variables selected for inclusion in the resulting tidy data set include the following:


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

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Additional vectors obtained by averaging the signals in a signal window sample(used on the angle() variable):


gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean


Derived variables calculated/estimated from these signals: 

mean(): Mean value (number)

std(): Standard deviation (number)

activity_name: Descriptive name of each subject's activity Type (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) (string)

subject_id : Identifier for subject Type (Integer Values: 1:30)

angle(): Angle between to vectors (number).



Please see the 'features.txt' and 'features_info.txt' files included in the source dataset downloaded by the run_Analysis.R script for further 
information about these variables.