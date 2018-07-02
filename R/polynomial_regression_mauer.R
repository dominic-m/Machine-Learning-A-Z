# Polynomial Regression

# Set working directory

# Importing the dataset
dataset <- read.csv('Position_Salaries.csv')
# Let's take only the two columns we're interested in
dataset <- dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Linear Regression to the dataset
lin_reg <- lm(formula = Salary ~ .,
              data = dataset)
summary(lin_reg)

# Fitting Polynomial Regression to the dataset
poly_reg <- lm(formula = Salary ~ .,
               data = dataset)

# We need to add the levels to the data set manually (these are the polynomial
# terms in the actual equation)

dataset$Level2 = dataset$Level^2

# To build a polynomial regression with higher degree, just add a Level3, Level4
# etc....

dataset$Level3 = dataset$Level^3

poly_reg <- lm(formula = Salary ~ .,
               data = dataset)
summary(poly_reg)

# Visualizing the Linear Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Linear Regression') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Polynomial Regression results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Polynomial Regression') +
  xlab('Level') +
  ylab('Salary')

# Add another level of accuracy and re-plot

dataset$Level4 = dataset$Level^4
# re-run the poly_reg regressor
poly_reg <- lm(formula = Salary ~ .,
               data = dataset)

ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Polynomial Regression') +
  xlab('Level') +
  ylab('Salary')

# Smooth out the line code:
# x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
# ggplot() +
#   geom_point(aes(x = dataset$Level, y = dataset$Salary),
#              colour = 'red') +
#   geom_line(aes(x = x_grid, y = predict(poly_reg,
#                                         newdata = data.frame(Level = x_grid,
#                                                              Level2 = x_grid^2,
#                                                              Level3 = x_grid^3,
#                                                              Level4 = x_grid^4))),
#             colour = 'blue') +
#   ggtitle('Truth or Bluff (Polynomial Regression)') +
#   xlab('Level') +
#   ylab('Salary')



# Predicting the result with Linear Regression
y_pred <- predict(object = lin_reg, data.frame(Level = 6.5))
y_pred

# Predicting the result with Polynomial regression
y_pred_poly <- predict(object = poly_reg, data.frame(Level = 6.5,
                                                     Level2 = 6.5^2,
                                                     Level3 = 6.5^3,
                                                     Level4 = 6.5^4))
y_pred_poly


