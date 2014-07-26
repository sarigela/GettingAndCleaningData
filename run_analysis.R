#COURSE: GEtting and Cleaning DATA
#Course Project.
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


runAnalysis <- function(){
  
  ######################################################################################################################
  ## 1.Merges the training and the test sets to create one data set.
  
  ## ColumNames
  dataColNames <- read.table(file("./UCI HAR Dataset/features.txt"), sep = "", strip.white = TRUE,  nrows = -1, na.strings = "NA")[,2]
  
  ## Training Data
  trainDataSet <- read.table(file("./UCI HAR Dataset/train/X_train.txt"), sep = "", strip.white = TRUE, col.names = dataColNames, check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = "complex")
  
  ## Test Data Set
  testDataSet <- read.table(file("./UCI HAR Dataset/test/X_test.txt"), sep = "", strip.white = TRUE, col.names = dataColNames, check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = "complex")
  
  dataset <- rbind (trainDataSet, testDataSet)
  ######################################################################################################################
  
  
  
  ######################################################################################################################
  ## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  meanStd <- grep("[Mm]ean[Ff]req", grep("\\.[Mm]ean|\\.[Ss]td", names(dataset), value = TRUE), value = TRUE, invert = TRUE)
  meanStdData <- dataset[meanStd]
  
  ######################################################################################################################
  
  
  
  
  ######################################################################################################################
  ## 3.Uses descriptive activity names to name the activities in the data set
  
  ## Subject Ids
  subjects <- rbind(
    ## Training Data set Subjects
    read.table(file("./UCI HAR Dataset/train/subject_train.txt"), sep = "", strip.white = TRUE, col.names = c("subjectId"), check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = "character")
    ,
    ## Test Data Set Subjects
    read.table(file("./UCI HAR Dataset/test/subject_test.txt"), sep = "", strip.white = TRUE, col.names = c("subjectId"), check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = "character")
  )
  
  ## Add Subjects to data set
  meanStdData <- cbind(subjects, meanStdData)
  
  ## Activities
  activities <- rbind(
    ## Training Data set activities
    read.table(file("./UCI HAR Dataset/train/y_train.txt"), sep = "", strip.white = TRUE, col.names = c("activityId"), check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = "character")
    ,
    ## Test Data Set activities
  read.table(file("./UCI HAR Dataset/test/y_test.txt"), sep = "", strip.white = TRUE, col.names = c("activityId"), check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = "character")
  )
  
  activityLabels <- read.table(file("./UCI HAR Dataset/activity_labels.txt"), sep = "", strip.white = TRUE, col.names = c("activityId", "activityName"), check.names = TRUE, nrows = -1, na.strings = "NA", skipNul = TRUE, colClasses = c("character", "character"))

  ## Add activity IDs to the data set.
  meanStdData$activityId <- activities$activityId
  
  ## Add Activity Names to the data set.
  meanStdData <- merge(meanStdData, activityLabels, by.x ="activityId", by.y = "activityId", all.x = TRUE, sort = FALSE)

  
  ######################################################################################################################
  
  
  
  
  ######################################################################################################################
  ## 4. Appropriately labels the data set with descriptive variable names. 
  meanStdData <- setDescriptiveVariableNames(meanStdData)
  
  ######################################################################################################################

  
  
  
  ######################################################################################################################
  ## 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  ## Resultant should have -- subjectID  activityName AvgVar1 AvgVar2.......

  ## install and load the package needed for MELT, DCAST  (Uncomment the below if package is not installed)
  ##install.packages("reshape2")
  library(reshape2)
  
  ## Melt the meanStdData (excluding the first column that is having Activity ID)
  meltData <- melt(meanStdData[, c(2:ncol(meanStdData))], id = c("subjectid", "activityname"))
  
  ## cast average/variable/activity/subject.
  dcastedData <- dcast(meltData, subjectid+activityname~..., mean)
  
  dcastedData  
  ######################################################################################################################
  
}

## This function processes the column names and convert them to readable format.
setDescriptiveVariableNames <- function(dataSet){
  
  variableNames <- names(dataSet)
  variableNames <- sub("\\.t", ".time", variableNames)                    ## t = Time
  variableNames <- sub("^t", "time.", variableNames)
  variableNames <- sub("\\.sts", ".standardDeviation", variableNames)     ## std = Standard Deviation
  variableNames <- sub("^f", "FFT.", variableNames)                       ## f = FFT = Fast Fourier Transform
  variableNames <- sub("Acc", ".acceleration", variableNames)             ## Acc = Acceleration
  variableNames <- sub("Mag", "Magnitude", variableNames)                 ## Mag = Magnitude
  variableNames <- sub("[Gg]yro", ".gyroscope.", variableNames)           ## gyro = gyroscope
  variableNames <- sub("sma", "SignalMagnitudeArea", variableNames)
  variableNames <- sub("arCoeff", "AutoregressionCoefficient", variableNames) ## arcoeff = Autoregression Coefficient
  variableNames <- gsub("\\.\\.|\\.\\.\\.", ".", variableNames)
  variableNames <- sub("\\.$", "", variableNames)
  variableNames <- tolower(variableNames)
  colnames(dataSet) <- variableNames
  
  dataSet
}
  