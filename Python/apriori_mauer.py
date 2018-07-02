# Apriori Algorithm

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header = None)

# The Apriori model requires a list (and/or a list of lists) for the data
transactions = []
for i in range(0, 7501):
    transactions.append([str(dataset.values[i,j]) for j in range(0, 20)])
# Without for j loop, it will return a list of size 1 rather than size 20

# Training Apriori on the dataset
from apyori import apriori
rules = apriori(transactions, min_support = 0.003, min_confidence = 0.2, min_lift = 3, min_length = 2)
# min_support first calculated for items purchased 3 times per week (3*7/7501)
# need to find optimal support, confidence, and list based on experiences or logical associations

# Visualizing the results
results = list(rules)
myResults = [list(x) for x in results]