import pandas as pd

dat = [
    [1,2,3,"=SUM(A1:A10)"], # row 1
    list(range(1,100)),   # row 2
    [7,8,9]                 # row 3
]

with pd.ExcelWriter("test.xlsx") as ew:
    pd.DataFrame(dat).to_excel(ew, sheet_name='Sheet_1', index=False, header=False)
