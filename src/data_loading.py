import pandas as pd
from sqlalchemy import create_engine

# Load CSV File
df = pd.read_csv("E:/Python/DataHire/data/salary_prediction_dataset.csv")

# MySQL Connection
username = "root"
password = "Amisha2012"
host = "localhost"
port = "3306"
database = "datahire"

engine = create_engine(f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}")

# Send data to MySQL
table_name = "salaries"

df.to_sql(name=table_name, con=engine, if_exists="replace", index=False)

print("Data successfully loaded into MySQL table")

# Confirm Data Loaded
result = pd.read_sql(f"SELECT * FROM {table_name} LIMIT 5;", con=engine)
print(result)