## Build tidy UCI HAR Dataset and then perform averages by subject_id and activity

##561 variables
##train has 7352 rows and 561 variables
##test has 2947 rows and 561 variables

setwd("D:/GregsStuff/Learning/DataScience/R")
library(tidyr)
library(dplyr)
features <- read.table("data/UCI HAR Dataset/features.txt", sep="") ##merge the column names onto their respective data sets
raw_variables<-as.vector(features[,2]) 
##features[grep('mean[^F]|std',features$V2),]
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt") %>% rename(subject_id = V1) #training subjects
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt") %>% rename(subject_id = V1) #test subjects
activity_key <- read.table("data/UCI HAR Dataset/activity_labels.txt") %>% rename(activity_code = V1, activity_name = V2) #activity key
activity_train <- read.table("data/UCI HAR Dataset/train/y_train.txt") %>% rename(activity_code = V1) %>%
    left_join(activity_key)  ##train activities
activity_test <- read.table("data/UCI HAR Dataset/test/y_test.txt") %>% rename(activity_code = V1) %>% 
    left_join(activity_key)  ##test activities
dataset_train <- read.table("data/UCI HAR Dataset/train/X_train.txt", sep="", col.names=raw_variables)%>% 
     mutate(dataset="train") %>%   ##noting that it is a train record
     mutate(dataset_rec_num = row_number()) %>%  #noting the row number of the train record
     cbind(subject_train) %>%   #attaching the subject number
     cbind(activity_train)  #attaching the activity
dataset_test <- read.table("data/UCI HAR Dataset/test/X_test.txt", sep="", col.names=raw_variables) %>% 
     mutate(dataset="test") %>%  #noting that it is a test record
     mutate(dataset_rec_num = row_number()) %>%  #nothing the row number of the test recoord
     cbind(subject_test) %>%  #attaching the subject number
     cbind(activity_test) #attaching the activity
combined_dataset <- rbind(dataset_train, dataset_test)  ##the train and test datasets combined together
narrowed_dataset <- select (combined_dataset, dataset, subject_id, activity_name, grep("mean[^F]|std",features$V2))  ##Look at only mean and std variables
names(narrowed_dataset) <- gsub("\\.\\.\\.","_axial_dir_",names(narrowed_dataset)) ##add "axial_dir label for X, Y, and Z
names(narrowed_dataset) <- gsub("^t","time_",names(narrowed_dataset))  ##translate 't' label to time
names(narrowed_dataset) <- gsub("^f","freq_domain_",names(narrowed_dataset))  ##translate 'f' label to freq_domain 
names(narrowed_dataset) <- gsub("BodyBody","Body",names(narrowed_dataset))  ##Fix "BodyBody" to be "Body"
names(narrowed_dataset) <- gsub("\\.mean","_mean",names(narrowed_dataset)) ##Change .mean to _mean
names(narrowed_dataset) <- gsub("\\.std","_std",names(narrowed_dataset))  ##Change .std to _std
names(narrowed_dataset) <- gsub("\\.\\.$","",names(narrowed_dataset))  ##Get rid of the .. at the end
names(narrowed_dataset) <- gsub("([a-z])([A-Z])","\\1_\\2",names(narrowed_dataset)) ## put '_' in between a capital letter and a lower case letter
names(narrowed_dataset) <- tolower(names(narrowed_dataset)) ##make all letters in names lower case
maindataset <- narrowed_dataset  # *************final main dataset***************

##******************final dataset 2  average by subject_id and activity
by_subject_and_activity <- aggregate(narrowed_dataset[,4:69], list(narrowed_dataset$subject_id, narrowed_dataset$activity_name), FUN=mean) %>% 
     rename(subject_id = Group.1) %>% rename (activity_name = Group.2)

##******************write out the datasets to a file*****************
write.csv(maindataset,"UCI_HAR/maindataset.csv")
write.csv(by_subject_and_activity,"UCI_HAR/avg_by_subj_activity.csv")











