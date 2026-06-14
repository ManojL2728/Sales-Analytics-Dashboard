import pandas as pd
from sqlalchemy import create_engine

# Read final cleaned dataset
df = pd.read_csv("sales_analytics_final.csv")

print("Dataset shape:", df.shape)

# MySQL connection
engine = create_engine(
    "mysql+pymysql://root:NewPassword%40123@localhost/sales_analytics"
)
# Load data into MySQL
df.to_sql(
    name="sales",
    con=engine,
    if_exists="replace",
    index=False,
    chunksize=1000
)

print("Data loaded successfully into MySQL table: sales")