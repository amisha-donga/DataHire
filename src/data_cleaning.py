import pandas as pd

df = pd.read_csv("E:/Python/DataHire/data/salary_prediction_dataset.csv")

print(df.isnull().sum())
print(df.dtypes)
print(df.duplicated().sum())


