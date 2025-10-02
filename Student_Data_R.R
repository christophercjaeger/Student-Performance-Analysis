setwd("C:/Users/chris/Downloads")

library(readr)
student_data <- read.csv("Project1.csv", sep =";")

View(student_data)

summary(student_data)



library(dplyr)
factor_vector<-c(school, sex, famsize, Parent_Status, Mother_Education, Father_Education, Mjob, Fjob, reason,guradian, schoolsup, famsup,paid,activities, nursery, higher, internet, romantic,absences2)



factor_vars <- c("school", "sex", "famsize", "Parent_Status", 
                 "Mother_Education", "Father_Education", "Mjob", 
                 "Fjob", "reason", "guardian", "schoolsup", "famsup",
                 "paid", "activities", "nursery", "higher", 
                 "internet", "romantic", "absences2")

student_data[factor_vars] <- lapply(student_data[factor_vars], as.factor)

linear_model <- lm(Total_score ~ .-G1 -G2 -G3 -Mother_Education -Father_Education -mother_education2 -Father_Education2- failures - absences2 -Mjob -Fjob -Walc -guardian -famrel -school - Parent_Status - nursery- traveltime2 -activities - traveltime -internet -paid - Dalc - absences -freetime, data=student_data)
summary(linear_model)


mean(student_data$Total_score)


linear_model <- lm(Total_score ~ . 
                   - G1 - G2 - G3 
                   - Mother_Education - Father_Education 
                   - mother_education2 - Father_Education2
                   - failures - absences2 
                   - Mjob - Fjob,
                   data = student_data)

step_model <- step(linear_model, direction = "both", trace = 1)

summary(step_model)



install.packages("rpart.plot")
library(rpart.plot)

install.packages("rpart")
library(rpart)
tree_model <- rpart(Total_score ~., data=student_data,method="anova")
rpart.plot(tree_model)


library(randomForest)
rf_model <- randomForest(Total_score ~., data=student_data, ntree=500)
rf_model<-varImpPlot(rf_model)



install.packages("rpart")
install.packages("rpart.plot")
install.packages("randomForest")

library(rpart)
library(rpart.plot)
library(randomForest)


tree_model <- rpart(Total_score ~ . -G1 -G2 -G3- failures, 
                    data = student_data, 
                    method = "anova")
rpart.plot(tree_model)

rf_model <- randomForest(Total_score ~ . -G1 -G2 -G3 - failures,
                         data = student_data,
                         ntree = 500,
                         importance = TRUE)

varImpPlot(rf_model)
