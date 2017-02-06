### setting the working Directory

setwd(/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4")


library(reshape2)
  
  ## Step1: read the .txt files and label the datasets

  activity_labels <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/activity_labels.txt", col.names=c("activity_id","activity_name"))
  features <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/features.txt")
  feature_names <-  features[,2]
  testdata <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/test/X_test.txt")
  ### Adding the colunn names
  colnames(testdata) <- feature_names
  
 
  traindata <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/train/X_train.txt")
  colnames(traindata) <- feature_names
  
 
  test_subject_id <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/test/subject_test.txt")
  colnames(test_subject_id) <- "subject_id"
  
  test_activity_id <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/test/y_test.txt")
  colnames(test_activity_id) <- "activity_id"
  
  train_subject_id <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/train/subject_train.txt")
  colnames(train_subject_id) <- "subject_id"
  
  train_activity_id <- read.table("/Users/bruno_olm94/Desktop/Curso Anaálise de Dados/Curso 3/Semana 4/evaluation/Dataset/train/y_train.txt")
  colnames(train_activity_id) <- "activity_id"
  
 ####Merging the files
  test_data <- cbind(test_subject_id , test_activity_id , testdata)
  train_data <- cbind(train_subject_id , train_activity_id , traindata)
  all_data <- rbind(train_data,test_data)
  
  ##Selectin the columns which have mean() or std() measuments
  mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
  mean_col_names <- names(all_data)[mean_col_idx]
  std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
  std_col_names <- names(all_data)[std_col_idx]
  meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
  
  ##Merge the activities datase with the mean/std values datase 
  ##to get one dataset with descriptive activity names
  descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
  
  #### Calculating the mean by individual using melt (longing) and dcast (widing) function

    ##Putting all the variables into a unique varialbe (make the dataset long)
    data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
    ## Calculating the mean of the measument by individual and activity
    mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)
  
  ##### Exporting the dataset
  write.table(mean_data,"./tidy_movement_data.txt")
  
