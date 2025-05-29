from rich.pretty import pprint as PP
import sqlite3
import os

dbfilename = "data.sql3"
if os.path.isfile(dbfilename):
    os.unlink(dbfilename)

cx = sqlite3.connect(dbfilename)
cx.execute("CREATE TABLE info (id INTEGER PRIMARY KEY, col1 TEXT, col2 INTEGER CHECK(typeof(col2)='integer'))")
cx.execute("CREATE INDEX idx_info_col1 ON info(col1)")
cx.commit()
cx.close()

cx = sqlite3.connect(dbfilename)
for i in range(0, 10):
    cx.execute("INSERT INTO info (col1, col2) VALUES (?, ?)", ("txt%d" % i, i))
cx.commit()


scols = ["col1", "col2"]
for row in cx.execute("SELECT %s from info WHERE col1 LIKE ? LIMIT 3" % ",".join(scols), ('t%',)):
    data = dict(zip(scols, row))
    PP(data)


cx.close()
