# Data wrangling ##############################################################

# Load data
data0<-read.csv("heart_failure_clinical_records_dataset.csv")
View(data0)

# Checking for Missing Values
is.na(data0)
sum(is.na(data0))

