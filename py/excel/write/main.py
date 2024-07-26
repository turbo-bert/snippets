import pandas as pd
from openpyxl.utils import get_column_letter
from openpyxl.styles import Font


dat = [
    [1,2,3,"=SUM(A1:A10)"], # row 1
    list(range(1,100)),   # row 2
    [7,8,9]                 # row 3
]


col_widths = [10, 20, 30]

with pd.ExcelWriter("test.xlsx") as ew:
    df1 = pd.DataFrame(dat)
    df1.to_excel(ew, sheet_name='Sheet_1', index=False, header=False)
    
    for col_idx in range(1,len(col_widths)+1):
        actual_width = col_widths[col_idx-1]
        column_letter = get_column_letter(col_idx)
        ew.sheets["Sheet_1"][column_letter + "1"].font = Font(bold=True)
        ew.sheets["Sheet_1"].column_dimensions[column_letter].width = actual_width
