subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)

Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",header = FALSE)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)

Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",header = FALSE)

X_test <- cbind(subject_test, Y_test, X_test)

X_train <- cbind(subject_train, Y_train, X_train)

X_AllDat <- rbind(X_train, X_test)

x_MeanSD <- X_AllDat[,1:8]

ActNames <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)

x_MeanSD <- merge(x_MeanSD,ActNames,by.x = "V1.1",by.y = "V1")

colnames(x_MeanSD) <- c("Act.Label","Subject","mean_X","mean_Y","mean_Z","std_X","std_Y","std_Z","Activity")

X_Tidy <- aggregate(list(AVE_mean_X = x_MeanSD$mean_X,AVE_mean_Y = x_MeanSD$mean_Y,AVE_mean_Z = x_MeanSD$mean_Z,AVE_std_X = x_MeanSD$std_X,AVE_std_Y = x_MeanSD$std_Y,AVE_std_Z = x_MeanSD$std_Z), by = list(Act.Label = x_MeanSD$Act.Label,Subject = x_MeanSD$Subject,Activity = x_MeanSD$Activity), mean)



