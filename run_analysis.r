library(dplyr)
X_train <- read.table("./data/train/X_train.txt", sep = ""
                      ,header = FALSE
                      ,nrows = 7352
                      ,col.names = features$features
)
y_train <- read.table("./data/train/y_train.txt", sep = ""
                      ,header = FALSE
                      ,nrows = 7352
)
subject_train <- read.table("./data/train/subject_train.txt", sep = ""
                            ,header = FALSE
                            ,nrows = 7352
)

X_test <- read.table("./data/test/X_test.txt", sep = ""
                     ,header = FALSE
                     ,nrows = 2947
                     ,col.names = features$features
)
y_test <- read.table("./data/test/y_test.txt", sep = ""
                     ,header = FALSE
                     ,nrows = 2947
)
subject_test <- read.table("./data/test/subject_test.txt", sep = ""
                           ,header = FALSE
                           ,nrows = 7352
)


head(select(X_train,1:10))

# 1.Merges the training and the test sets to create one data set.

train_df <- cbind(X_train, activity = y_train$V1, subject = subject_train$V1)
test_df <- cbind(X_test, activity = y_test$V1, subject = subject_test$V1)

head(test_df[,c(1,2,561:563)])
df <- rbind(train_df,test_df)

#--------------------------------------------------------------------#
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

activity <- read.table("./data/activity_labels.txt"
                       , col.names = c("code", "activity")
                       , stringsAsFactors = FALSE)
features <- read.table("./data/features.txt"
                       , col.names = c("num","features")
                       , stringsAsFactors = FALSE)

df_mean_sd <- df %>% select(subject,  activity, contains("mean"), contains("std"))
names(df_mean_sd)

#--------------------------------------------------------------------#

#3. Uses descriptive activity names to name the activities in the data set

df$activity <- activity[df$activity, 2]

#--------------------------------------------------------------------#

# 4. Appropriately labels the data set with descriptive variable names. 
names(df) <- gsub( "\\.+$","",names(df)) # remove dots in the end
names(df) <- gsub("\\.\\.+",".",names(df)) # replace more than 1 dot with single dot
names(df) <- gsub("BodyBody","Body", names(df)) 
names(df) <- gsub("^t","time",names(df)) 
names(df) <- gsub("^f","frequency",names(df))

#--------------------------------------------------------------------#

# 5.From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.


tidy_data <- df %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

tidy_data

write.table(tidy_data, "TidyData.txt", row.name=FALSE)
