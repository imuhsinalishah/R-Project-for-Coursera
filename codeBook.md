# CodeBook

## Dataset Overview
This dataset contains measurements from accelerometers on the Samsung Galaxy S smartphone. It includes training and test data, which were merged and cleaned.

## Variables
1. **subject**: Identifier for the subject performing the activity (1-30).
2. **activity**: Descriptive names of the activities (e.g., WALKING, SITTING).
3. **Mean and Std Measurements**: Various features representing mean and standard deviation (e.g., `tBodyAcc-mean()-X`).

## Transformations
1. Merged training and test datasets.
2. Extracted only mean and standard deviation features.
3. Applied descriptive names to activities and variables.
4. Created a second dataset with averages for each activity and subject.
