# Installing packages associated with Random Forest

install.packages(randomForest)

#install random forest Library
library(randomForest)

wine_quality<-read.csv("C:/Users/Lux Dev/wine_quality.csv")


head(wine_quality)



boxplot(wine_quality$total.sulfur.dioxide)

# Encode categorical Variables
wine_quality$quality = as.factor(wine_quality$quality)

#Splitting data into Train and Test Sets

data_test_size = floor(nrow(wine_quality)* 0.80)
index<-sample(1:nrow(wine_quality), size = data_test_size)
training<-wine_quality[index,]
testing<-wine_quality[index,]

#Modeling the rf
rf<-randomForest(quality~ ., wine_quality, mtry=4, ntree=2001, importance=TRUE)
rf


plot(rf)

#Predicting the results
result<-data.frame(testing$quality, predict(rf, testing[,1:11], type="response"))

result

plot(result)
