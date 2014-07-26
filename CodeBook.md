CODE BOOK
=========
This code book contains information about each of the variable that are results of the run_analysis.R file.
It also contains information regarding the source of the data and their license information in order acknowledge their efforts in performing this experiment and sharing this information with others.

<B>Experiment Information</B>
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

<B><I>For each record it is provided:</I> </B>

* Mean of Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Mean Triaxial Angular velocity from the gyroscope. 
* The original experiment data of 561-feature vector with time and frequency domain variables are cleaned up to create 68-features that are <B><I> mean </I></B>and <B><I>Standard Deviation </I></B>.
* Its activity label. 
* An identifier of the subject who carried out the experiment.
* <B><I>NOTE: The resultant features in the tidy data set with the mean value of each feature per activity per participant. </B></I>

Description of the data set:
=============================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.body.acceleration.jerk-XYZ and time.body.gryroscope.jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time.body.accelerationmagnitude, time.gravity.accelerationjerkmagnitude, time.body.accelerationjerkmagnitude, time.body.gyroscope.magnitude, time.body.gryroscope.jerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fft.body.acceleration-XYZ, fft.body.accelerationjerk-XYZ, fft.body.gryroscope-XYZ, fft.body.acceleration.jerkmagnitude, fft.body.gryroscope.magnitude, fft.body.gryroscope.jerkmagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The below database has <B>mean</B and <B>standard deviation</B> value for each of these features averaged(mean computed) per activity per observation.

 [1] "subjectid"                      The participant / subject's identification number.
 [2] "activityname"                   The name of the activity being performed by the subject like walking, sitting, standing, etc.           
 [3] "time.body.acceleration.mean.x"  	Mean of tBodyAcc.mean-X            
 [4] "time.body.acceleration.mean.y"  	Mean of tBodyAcc.mean-Y            
 [5] "time.body.acceleration.mean.z"  	Mean of tBodyAcc.mean-Z            
 [6] "time.body.acceleration.std.x"   	Mean of tBodyAcc.std-X            
 [7] "time.body.acceleration.std.y"   	Mean of tBodyAcc.std-Y             
 [8] "time.body.acceleration.std.z"   	Mean of tBodyAcc.std-Z               
 [9] "time.gravity.acceleration.mean.x"           
[10] "time.gravity.acceleration.mean.y"           
[11] "time.gravity.acceleration.mean.z"           
[12] "time.gravity.acceleration.std.x"            
[13] "time.gravity.acceleration.std.y"            
[14] "time.gravity.acceleration.std.z"            
[15] "time.body.accelerationjerk.mean.x"          
[16] "time.body.accelerationjerk.mean.y"          
[17] "time.body.accelerationjerk.mean.z"          
[18] "time.body.accelerationjerk.std.x"           
[19] "time.body.accelerationjerk.std.y"           
[20] "time.body.accelerationjerk.std.z"           
[21] "time.body.gyroscope.mean.x"                 
[22] "time.body.gyroscope.mean.y"                 
[23] "time.body.gyroscope.mean.z"                 
[24] "time.body.gyroscope.std.x"                  
[25] "time.body.gyroscope.std.y"                  
[26] "time.body.gyroscope.std.z"                  
[27] "time.body.gyroscope.jerk.mean.x"            
[28] "time.body.gyroscope.jerk.mean.y"            
[29] "time.body.gyroscope.jerk.mean.z"            
[30] "time.body.gyroscope.jerk.std.x"             
[31] "time.body.gyroscope.jerk.std.y"             
[32] "time.body.gyroscope.jerk.std.z"             
[33] "time.body.accelerationmagnitude.mean"       
[34] "time.body.accelerationmagnitude.std"        
[35] "time.gravity.accelerationmagnitude.mean"    
[36] "time.gravity.accelerationmagnitude.std"     
[37] "time.body.accelerationjerkmagnitude.mean"   
[38] "time.body.accelerationjerkmagnitude.std"    
[39] "time.body.gyroscope.magnitude.mean"         
[40] "time.body.gyroscope.magnitude.std"          
[41] "time.body.gyroscope.jerkmagnitude.mean"     
[42] "time.body.gyroscope.jerkmagnitude.std"      
[43] "fft.body.acceleration.mean.x"               
[44] "fft.body.acceleration.mean.y"               
[45] "fft.body.acceleration.mean.z"               
[46] "fft.body.acceleration.std.x"                
[47] "fft.body.acceleration.std.y"                
[48] "fft.body.acceleration.std.z"                
[49] "fft.body.accelerationjerk.mean.x"           
[50] "fft.body.accelerationjerk.mean.y"           
[51] "fft.body.accelerationjerk.mean.z"           
[52] "fft.body.accelerationjerk.std.x"            
[53] "fft.body.accelerationjerk.std.y"            
[54] "fft.body.accelerationjerk.std.z"            
[55] "fft.body.gyroscope.mean.x"                  
[56] "fft.body.gyroscope.mean.y"                  
[57] "fft.body.gyroscope.mean.z"                  
[58] "fft.body.gyroscope.std.x"                   
[59] "fft.body.gyroscope.std.y"                   
[60] "fft.body.gyroscope.std.z"                   
[61] "fft.body.accelerationmagnitude.mean"        
[62] "fft.body.accelerationmagnitude.std"         
[63] "fft.bodybody.accelerationjerkmagnitude.mean"           
[64] "fft.bodybody.accelerationjerkmagnitude.std"           
[65] "fft.bodybody.gyroscope.magnitude.mean"           
[66] "fft.bodybody.gyroscope.magnitude.std"       
[67] "fft.bodybody.gyroscope.jerkmagnitude.mean"  
[68] "fft.bodybody.gyroscope.jerkmagnitude.std"


<BR> </BR>
<b>ORIGINAL EXPERIEMENT INFORMATION</b>
----------------------------------------------------------
Human Activity Recognition Using Smartphones Dataset
Version 1.0
----------------------------------------------------------
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
----------------------------------------------------------

<b>Notes:</b> 
----------
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
--------
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.