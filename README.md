# Getting-Clearing-Data Course Project
Description of run_analysis.R script

This script reads the data from wd, combine the files  according project requirements and creates a tidy data set with averages of the selected coulumns, grouped by subjects and activities.

Precondition
library to be installed: data.table


##Program flow

###1.Merges the training and the test sets to create one data set. 
Read the train mesurments file into data.table data.frame
Add activity colunm read from subject_train.txt file
Add subject colunm read  subject_train.txt from file
Read the test mesurments file into data.table data.frame
Add activity colunm read from subject_test.txt file
Add subject colunm read  subject_test.txt from file
Merge train and test data into one data frame


###2.Extracts only the measurements on the mean and standard deviation for each measurement.

Select  only mean(), std(), subject and activity coulumns.
Add subject and activity information as well
Subset data according 2 conditions above.



###3.Uses descriptive activity names to name the activities in the data set
Convert activity to factor and change values of factors to descriptive ones. 


###4.Appropriately labels the data set with descriptive variable names. 
Create vector with the names ftom features.txt file , select with already creted selector vector,
and extend  it with activity and soubject names
Rename the coloumns of data using the vector created above.


###5.From the data set in step 4, creates a second, independent tidy data set
With the average of each variable for each activity and each subject.
Aggregate function groupes the rows according activity/subject pairs and  calculates the averages of the groups.
The file is being converted into data frame and saved into step_5.txt file



