# Tidy_Data_Assignment

The scrip requires the dataset to be present in the ./data folder as defined by following file structure.
./data
  |- train
  |- test
  |- features_info.txt
  |- features.txt
  |- activity_labels.txt
  |- README.txt
  
  The script outputs a file TidyData.txt in the working directory containing the final output i.e. tidy data with the average of each variable for each activity and each subject.
  
  ### Variables
  1. train_df: A data.frame combining X_train, subject_train and y_train
  2. test_df: A data.frame combining X_test, subject_test and y_test
  3. df: A data.frame combining all train and test data, output pf first problem
  4. df_mean_sd: A data.frame containing measurements on the mean and standard deviation for each measurement, output of problem 2.
  5. tidy_data: A data.frame containing Tidy Data with the average of each variable for each activity and each subject, output of prblem 5 and final output.
  
  
