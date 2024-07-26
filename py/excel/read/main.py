import os
import pandas

with pandas.ExcelFile("test.xlsx") as f:
    print(f.sheet_names)

df = pandas.read_excel("test.xlsx", dtype=str, header=None, sheet_name="Sheet1")
n_rows = len(df)
n_cols = len(df.columns)
print(n_rows)
print(n_cols)
print(df.loc[0,0]) # A1
print(df.loc[1,1])
