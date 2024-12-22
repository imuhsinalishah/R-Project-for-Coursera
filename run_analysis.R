# Load necessary libraries
library(dplyr)

# Download and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "dataset.zip")
unzip("dataset.zip")

# Read training and test data
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Read features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))

# Merge training and test data
x_data <- rbind(train_x, test_x)
y_data <- rbind(train_y, test_y)
subject_data <- rbind(train_subject, test_subject)

# Extract mean and standard deviation measurements
mean_std_features <- grep("mean|std", features$feature)
x_data <- x_data[, mean_std_features]
colnames(x_data) <- features$feature[mean_std_features]

# Use descriptive activity names
y_data$V1 <- activity_labels[y_data$V1, 2]
colnames(y_data) <- "activity"
colnames(subject_data) <- "subject"

# Combine all data
tidy_data <- cbind(subject_data, y_data, x_data)

# Create second dataset with averages
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Write the tidy dataset to a file
write.table(final_data, "tidy_dataset.txt", row.name = FALSE)
