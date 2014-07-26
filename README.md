GettingAndCleaningData
======================

Coursera course 3 - Getting and Cleaning Data - Course Project


The repository has two other files 1)CodeBook and 2) run_analysis.R file. 
The code book lists the variables that are the outcome from the script run_analysis.R file.

The run_analysis.R file has two method namely:  
a) runAnalysis() --> This performs the required project work returs a tidy data set as required. The detailed description below explains each of the steps that is done within this function.

b) setDescriptiveVariableNames() -- This function is called within runAnalysis() to create descriptive variable names for the data set. The actions performed by this function are described in STEP 4 below.

STEP BY STEP DESCRIPTION OF FUCNTION ACTIONS:
============================================

STEP 1.Merges the training and the test sets to create one data set.
1) Read the feautures.txt file for the Column names of the data set (say InitialColNames).
2) Read data training data from X_train.txt with InitialColNames as the column names.
3) Read data testing data from X_text.txt with column names set as InitialColNames.
4) Row bind these two data set to create on big data set (DATASET1).

STEP 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
1) From the data set created above fetch the column names  (or) it is equivalent to InitialColNames.
2) Create a vector with column names that are having "mean and "std" by using "grep" command over the column names from above set.
3) Make sure that you fetch columns which are required and not those thing that has text like "meaning", "meanfreq" and similar others.
4) Use this grep'ed vector to do subsetting from the (DATASET2)

STEP 3.Uses descriptive activity names to name the activities in the data set
1) Fetch Subject Ids from subject_train.txt and subject_test.text.
2) Row bind these two so that we have one set of data for all subjects Ids (say: SubjectId)
3) Add the SubjectID data set as a new column to the previous data (DATASET2) forming a new data set (DATASET3)
4) Read Activities data from y_train.txt and y_test.txt and then row bind them together.
5) Add these activity id list as a new column to the data set (DATASET3) forming a new data set (DATASET4)
6) Read the activity labels/names from activity_labels.txt file.
7) Merge the activity labels read with the data we have (DATASET4), joining over the column of "Activity Id".
8) This gives the data set with Activity ID, activity name, subject id and all the features with observations. (DATASET5)

STEP 4. Appropriately labels the data set with descriptive variable names.
1) A new function is created with name 'setDescriptiveVariableNames' and is called providing the DATASET5.
2) This function purpose is take in data set and appropriately labels the data set with descriptive variable names.
3) It replaces abbreviation with full descriptive text such as t = Time, std=Standard Deviation, f = FFT, Acc=Acceleration,
   Mag = Magnitude, gyro = gyroscope, sma = Signal Magnitude Area, arcoeff and so on.
4) It ensure no repetitive "." are present in the name so that variable names are easily read and written.
5) Remove "." from the end of a variable (feature) name to give readability.
6) Converts all characters to lower case.  This eases & brings down programming typing mistakes and necessity to remember
   exact casing for variable names.
7) After processing all the above over the variable names, the provided data set's variable names will be replaced with 
   the resultant appropriate descriptive labels for all variables.
8) Finally DATASET5's variable names are having descriptive labels.

STEP 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1) Install and load the library "reshape2" if not already done.
2) Melt the DATASET5 such that the resultant data set will have "SubjectID", "Activity Name", "Variable" and "Value". (DATASET6)
3) The melted data set (DATASET6) should be reshaped using "dcast" command such that all observation of an activity for a subject 
   are averaged. (mean should be passed to dcast to perform the averaging action per observation/activity/subject.
4) The resultant data set will be a tidy data set with average of each variable for each activity and each subject.

