# Code book
## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time Accelerometer-XYZ and Time Gyroscope-XYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Body Accelerometer and Gyroscope) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time Body Gyroscope Jerk-XYZ and Time Body Accelerometer Jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of signals producing (Note the 'Frequency' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
