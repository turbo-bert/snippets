import mxee.helper

def my_callback(r, hdr, row, row_assoc, row_named, context):
    pass

ctx={}
mxee.helper.xlsx_rows('file.xlsx', 'sheet1', my_callback, ctx)
