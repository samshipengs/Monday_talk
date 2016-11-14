library(mice)
library(lattice)
# data path
data_path <- '/home/sam/Desktop/Monday_talk/data/'
# read data
train_df <- read.csv(paste(data_path, 'train_missed.csv', sep=''), fill = TRUE, na.strings=c(""," ","NA"))

# perform MICE
tempData <- mice(train_df, m=5, maxit=50, meth='pmm', seed=42)
summary(tempData)
bwplot(tempData)
densityplot(tempData)

# get completed data
completedData <- complete(tempData, 1)
write.csv(completedData, paste(data_path, 'miced.csv', sep=''), row.names = FALSE)

