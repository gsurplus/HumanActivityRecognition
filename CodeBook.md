# Codebook for run_analysis.R

## Purpose of Script
To read in the data files from the Human Activity Recognition Using Smartphones Data Set and to provide a primary tidy data set.  A secondary dataset will be
created that gives the averages of each of the variables by subject_id, and 
activity.

## The main raw data files
There are two main data files.  One containing those in the train group which has 7,352 rows and one in the test group which contains 2,947 rows.  Both contain 561 variables.  The variables, subject ids and activities are in separate files that must be read in and merged.

## Datafiles read in
* features.txt: Contains the 561 variable names in their X_train and X_test data sets
* subject_train.txt: The subject id of each record in the train data set
* subject_test.txt: The subject id of each record in the test data set
* activity_labels.txt: A file that contains the text description of each activity code
* y_train.txt: A file containing the activity code for each record in the train data set
* y_test.txt: A file containing the activity code for each record in the test data set
* X_train.txt: The actual data from the train group
* X_test.txt: The actual data from the test group
 
## Making the first data set: maindataset.csv
The variables, activities, and subject_id files for their respective train and 
test groups were merged together.  Then the train and test datasets were 
appended together.  Variables not relating to the mean or standard deviations 
were dropped.  
### Specific data processing procedures
* The variables were read into a table
* The train subject ids were read into subject_train
* The test subject ids were read into subject_test
* The activity labels were read into activity_key
* The activity codes for the train group was read into activity_train while joining the activity labels.
* The activity codes for the test group was read into activity_test while joining the activity labels.
* The train dataset was read while binding the subject id from subject_train and binding the activity from activity_train
* The test dataset was read while binding the subject id from subject_test and binding the activity from activity_test
* The train and test datasets were combined.
* The dataset was reduced to only the mean and standard deviation columns
* Variable names were made more descriptive by pointing out axial direction
* Time and frequency domain variables were made explicity clear
* Periods were replaced with '_'.  Uppercase letters followed by lower were separated by a '_'.
* Variables were made all lower case.

## Making the second data set: avg_by_subj_activity.csv
The averages were computed by subject and activity using the command:
* by_subject_and_activity <- aggregate(narrowed_dataset[,4:69], list(narrowed_dataset$subject_id, narrowed_dataset$activity_name), FUN=mean) %>% 
     rename(subject_id = Group.1) %>% rename (activity = Group.2)

## Variable names of the main data set:
1. subject_id: The unique code used to identify the subject
2. activity_name: The text description of the activity being performed such as:
	* Walking
	* Walking Upstairs
	* Walking Downstairs
	* Sitting
	* Standing
	* Laying
3. time_body_acc_mean_axial_dir_x: Time domain signals captured at constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the body split of the acceleration signal.  This is the mean of the X direction of the 3-axial signal.
4. time_body_acc_mean_axial_dir_y:  Time domain signals captured at constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the body split of the acceleration signal.  This is the mean of the Y direction of the 3-axial signal.
5. time_body_acc_mean_axial_dir_z:  Time domain signals captured at constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the body split of the acceleration signal.  This is the mean of Z direction of the 3-axial signal.
6. time_body_acc_std_axial_dir_x: Time domain signals captured at constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the body split of the acceleration signal.  This is the stardard deviation of the X direction of the 3-axial signal.
7. time_body_acc_std_axial_dir_y:  Time domain signals captured at constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the body split of the acceleration signal.  This is the standard deviation of the Y direction of the 3-axial signal.
8. time_body_acc_std_axial_dir_z:  Time domain signals captured at constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the body split of the acceleration signal.  This is the standard deviation of Z direction of the 3-axial signal.
9. time_gravity_acc_mean_axial_dir_x: Time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the gravity split of the acceleration signal.  This is the mean of the X direction of the 3-axial signal.
10. time_gravity_acc_mean_axial_dir_y: Time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the gravity split of the acceleration signal.  This is the mean of the Y direction of the 3-axial signal.
11. time_gravity_acc_mean_axial_dir_z: Time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the gravity split of the acceleration signal.  This is the mean of the Z direction of the 3-axial signal.
12. time_gravity_acc_std_axial_dir_x: Time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the gravity split of the acceleration signal.  This is the standard deviation of the X direction of the 3-axial signal.
13. time_gravity_acc_std_axial_dir_y: Time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the gravity split of the acceleration signal.  This is the standard deviation of the Y direction of the 3-axial signal.
14. time_gravity_acc_std_axial_dir_z: Time domain signals captured at a constant rate of 50 Hz, filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20hz.  This is the gravity split of the acceleration signal.  This is the standard deviation of the Z direction of the 3-axial signal.
15. time_body_acc_jerk_mean_axial_dir_x: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the body linear acceleration derived to obtain jerk signals.  This is the mean of the X direction of the 3-axial signal.
16. time_body_acc_jerk_mean_axial_dir_y: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the body linear acceleration derived to obtain jerk signals.  This is the mean of the Y direction of the 3-axial signal.
17. time_body_acc_jerk_mean_axial_dir_z: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the body linear acceleration derived to obtain jerk signals.  This is the mean of the Z direction of the 3-axial signal.
18. time_body_acc_jerk_std_axial_dir_x: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the body linear acceleration derived to obtain jerk signals.  This is the standard deviation of the X direction of the 3-axial signal.
19. time_body_acc_jerk_std_axial_dir_y: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the body linear acceleration derived to obtain jerk signals.  This is the standard deviation of the Y direction of the 3-axial signal.
20. time_body_acc_jerk_std_axial_dir_z: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the body linear acceleration derived to obtain jerk signals.  This is the standard deviation of the Z direction of the 3-axial signal.
21. time_body_gyro_mean_axial_dir_x: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz. This is angular velocity and is the mean of the X direction of the 3-axial signal.
22. time_body_gyro_mean_axial_dir_y: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz. This is angular velocity and is the mean of the Y direction of the 3-axial signal.
23. time_body_gyro_mean_axial_dir_z: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz. This is angular velocity and is the mean of the Z direction of the 3-axial signal.
24. time_body_gyro_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz. This is angular velocity and is the standard deviation of the X direction of the 3-axial signal.
25. time_body_gyro_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz. This is angular velocity and is the standard deviation of the Y direction of the 3-axial signal.
26. time_body_gyro_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz. This is angular velocity and is the standard deviation of the Z direction of the 3-axial signal.
27. time_gyro_jerk_mean_axial_dir_x: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the angular velocity derived to obtain jerk signals.  This is the mean of the X direction of the 3-axial signal.
28. time_gyro_jerk_mean_axial_dir_y: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the angular velocity derived to obtain jerk signals.  This is the mean of the Y direction of the 3-axial signal.
29. time_gyro_jerk_mean_axial_dir_z: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the angular velocity derived to obtain jerk signals.  This is the mean of the Z direction of the 3-axial signal.
30. time_gyro_jerk_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the angular velocity derived to obtain jerk signals.  This is the standard deviation of the X direction of the 3-axial signal.
31. time_gyro_jerk_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the angular velocity derived to obtain jerk signals.  This is the standard deviation of the Y direction of the 3-axial signal.
32. time_gyro_jerk_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  This is the angular velocity derived to obtain jerk signals.  This is the standard deviation of the Z direction of the 3-axial signal.
33. time_body_acc_mag_mean: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the body acceleration 3D signals were calculated using the Euclidean norm.  This is the mean of the values. 
34. time_body_acc_mag_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the body acceleration 3D signals were calculated using the Euclidean norm.  This is the standard deviation of the values. 
35. time_gravity_acc_mag_mean: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the gravity acceleration 3D signals were calculated using the Euclidean norm.  This is the mean of the values.
36. time_gravity_acc_mag_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the gravity acceleration 3D signals were calculated using the Euclidean norm.  This is the standard deviation of the values.
37. time_body_acc_jerk_mag_mean: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the body acceleration jerk 3D signals were calculated using the Euclidean norm.  This is the mean of the values. 
38. time_body_acc_jerk_mag_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the body acceleration jerk 3D signals were calculated using the Euclidean norm.  This is the standard deviation of the values. 
39. time_body_gyro_mag_mean: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the angular velocity 3D signals were calculated using the Euclidean norm.  This is the mean of the values.  
40. time_body_gyro_mag_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the angular velocity 3D signals were calculated using the Euclidean norm.  This is the standard deviation of the values. 
41. time_body_gyro_jerk_mag_mean: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the angular velocity jerk 3D signals were calculated using the Euclidean norm.  This is the mean of the values. 
42. time_body_gyro_jerk_mag_std: Time domain signals captured at a constant rate of 50Hz, filtered using a median filter and a 3rd order low pass Butterwoth filter with a corner frequency of 20Hz.  The magnitude of the angular velocity jerk 3D signals were calculated using the Euclidean norm.  This is the standard deviation of the values. 
43. freq_domain_body_acc_mean_axial_dir_x: Fast Fourier Transform applied to the body acceleration signal to produce frequency domain signal.  This is the mean value in the X axial direction.
44. freq_domain_body_acc_mean_axial_dir_y: Fast Fourier Transform applied to the body acceleration signal to produce frequency domain signal.  This is the mean value in the Y axial direction.
45. freq_domain_body_acc_mean_axial_dir_z: Fast Fourier Transform applied to the body acceleration signal to produce frequency domain signal.  This is the mean value in the Z axial direction.
46. freq_domain_body_acc_std_axial_dir_x: Fast Fourier Transform applied to the body acceleration signal to produce frequency domain signal.  This is the standard deviation value in the X axial direction.
47. freq_domain_body_acc_std_axial_dir_y: Fast Fourier Transform applied to the body acceleration signal to produce frequency domain signal.  This is the standard deviation value in the Y axial direction.
48. freq_domain_body_acc_std_axial_dir_z: Fast Fourier Transform applied to the body acceleration signal to produce frequency domain signal.  This is the standard deviation value in the Z axial direction.
49. freq_domain_body_acc_jerk_mean_axial_dir_x: Fast Fourier Transform applied to jerk (derived in time) body acceleration to produce the frequency domain signal.  This is the mean value in the X axial direction. 
50. freq_domain_body_acc_jerk_mean_axial_dir_y: Fast Fourier Transform applied to jerk (derived in time) body acceleration to produce the frequency domain signal.  This is the mean value in the Y axial direction. 
51. freq_domain_body_acc_jerk_mean_axial_dir_z: Fast Fourier Transform applied to jerk (derived in time) body acceleration to produce the frequency domain signal.  This is the mean value in the Z axial direction. 
52. freq_domain_body_acc_jerk_std: Fast Fourier Transform applied to jerk (derived in time) body acceleration to produce the frequency domain signal.  This is the standard deviation value in the X axial direction. 
53. freq_domain_body_acc_jerk_std: Fast Fourier Transform applied to jerk (derived in time) body acceleration to produce the frequency domain signal.  This is the standard deviation value in the Y axial direction. 
54. freq_domain_body_acc_jerk_std: Fast Fourier Transform applied to jerk (derived in time) body acceleration to produce the frequency domain signal.  This is the standard deviation value in the Z axial direction. 
55. freq_domain_body_gyro_mean_axial_dir_x: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the mean value in the X axial direction.
56. freq_domain_body_gyro_mean_axial_dir_y: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the mean value in the Y axial direction.
57. freq_domain_body_gyro_mean_axial_dir_z: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the mean value in the Z axial direction.
58. freq_domain_body_gyro_std: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the standard deviation value in the X axial direction.
59. freq_domain_body_gyro_std: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the standard deviation value in the Y axial direction.
60. freq_domain_body_gyro_std: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the standard deviation value in the Z axial direction.
61. freq_domain_body_acc_mag_mean: Fast Fourier Transform applied to body acceleration to produce the frequency domain signal.  This is the mean value of the magnitude of the body acceleration 3-D signals using the Euclidean norm. 
62. freq_domain_body_acc_mag_std: Fast Fourier Transform applied to body acceleration to produce the frequency domain signal.  This is the standard deviation value of the magnitude of the body acceleration 3-D signals using the Euclidean norm. 
63. freq_domain_body_acc_jerk_mag_mean: Fast Fourier Transform applied to body acceleration jerk signals to produce the frequency domain signal.  This is the mean value of the magnitude of the body acceleration jerk 3-D signals using the Euclidean norm.
64. freq_domain_body_acc_jerk_mag_std: Fast Fourier Transform applied to body acceleration jerk signals to produce the frequency domain signal.  This is the standard deviation value of the magnitude of the body acceleration jerk 3-D signals using the Euclidean norm.
65. freq_domain_body_gyro_mag_mean: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the mean value of the magnitude of the angular velocity 3-D signals using the Euclidean norm.
66. freq_domain_body_gyro_mag_std: Fast Fourier Transform applied to angular velocity to produce the frequency domain signal.  This is the standard deviation value of the magnitude of the angular velocity 3-D signals using the Euclidean norm.
67. freq_domain_body_gyro_jerk_mag_mean: Fast Fourier Transform applied to angular velocity jerk signals to produce the frequency domain signal.  This is the mean value of the magnitude of the angular velocity jerk 3-D signals using the Euclidean norm.
68. freq_domain_body_gyro_jerk_mag_std: Fast Fourier Transform applied to angular velocity jerk signals to produce the frequency domain signal.  This is the standard deviation value of the magnitude of the angular velocity jerk 3-D signals using the Euclidean norm.
## Variable names in the second data set:
Variable names are identical to the first dataset
