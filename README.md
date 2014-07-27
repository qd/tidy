tidy
====

Getting and cleaning data project script in R see also "Code Book.txt"  

The "run_analysis.R" script must be in the same directory  
as "getdata_projectfiles_UCI HAR Dataset.zip" note that  
the script works with the zipfile and does not touch the data.  
Output is the textfile "tidyDataSet.txt" containing onl  
the mean and std of each dataset. It:  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. activity names: "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING" and "LAYING"  
4. Appropriately labels the data set with descriptive variable names.  
And,  
5. In addition corresponding to Item 5 of the assignment,creates a second  
independent tidy data set with the average of each variable for each activity  
and each subject "averagesdf" data.frame containing  
the average values of all measurements by subject and activity.  
"averagesdf" is not printed out but becomes available in the environment. 
Sample partial output:  
>averagesdf[40:45,1:5]		
   subjectID           activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z  
40         7            SITTING         0.2846746       -0.01461098       -0.12246460  
41         7           STANDING         0.2827235       -0.01457403       -0.09977783  
42         7             LAYING         0.2501767       -0.02044115       -0.10136104  
43         8            WALKING         0.2746863       -0.01866289       -0.10725209  
44         8   WALKING_UPSTAIRS         0.2588802       -0.02824151       -0.11512212  
45         8 WALKING_DOWNSTAIRS         0.2834841       -0.02110587       -0.10759814  
