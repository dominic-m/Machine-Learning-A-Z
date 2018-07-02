#Multiple Linear Regression

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

#Before splitting the dataset, we need to factor the state column
# Encoding categorical data
dataset$State <- factor(dataset$State,
                        levels = c('New York', 'California', 'Florida'),
                        labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression to the Training set

#regressor <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
#the . is a shortcut for R to understand it is a linear combination of all the variables
regressor <- lm(formula = Profit ~ ., data = training_set)

summary(regressor)
#After looking at the coefficients, notice R.D.SPend is the only highly statistically
#signifant, so we could change the formula to Profit ~ R.D.Spend

#Predicting the Test Set Results
y_pred <- predict(regressor, newdata = test_set)
y_pred #view our results

#Building the optimal model using Backward Elimination
#need to list all independent variables separately so we can eliminate one by one
regressor_be <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                   data = dataset)
summary(regressor_be)

#now look for independent variable with highest P value over SL and remove
#need to remove State2 (and can remove State3 since it is so high as well)
regressor_be <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                   data = dataset)
summary(regressor_be)

#repeat: remove ind. variable with P value > SL again
regressor_be <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                   data = dataset)
summary(regressor_be)

#marketing.spend is close, but we will remove again for practice
regressor_be <- lm(formula = Profit ~ R.D.Spend,
                   data = dataset)
summary(regressor_be)

#just a test to see how significant marketing.spend is to profit
regressor_be2 <- lm(formula = Profit ~  Marketing.Spend,
                   data = dataset)
summary(regressor_be2)