from sqlalchemy import event, MetaData, create_engine
import os
import contextlib

with contextlib.suppress(FileNotFoundError): os.unlink("test.sql")


src_engine = create_engine("mysql+pymysql://root:foo123@127.0.0.1:33060/test")
src_metadata = MetaData()

dst_engine = create_engine("sqlite:///test.sql")
dst_metadata = MetaData()

# normalize some data types like TINYINT, .... when going from MySQL to SQLite
@event.listens_for(src_metadata, "column_reflect")
def generic_datatypes(inspector, tablename, column_dict):
    column_dict["type"] = column_dict["type"].as_generic(allow_nulltype=True)

src_conn = src_engine.connect()
dst_conn = dst_engine.connect()

dst_metadata.reflect(bind=dst_engine)
src_metadata.reflect(bind=src_engine)

# more filters? (than GENERIC TYPES)

for table in src_metadata.sorted_tables:
    pass
    #TODO remove collations

for table in src_metadata.sorted_tables:
    table.create(bind=dst_engine)

src_conn.commit()
src_conn.close()

dst_conn.commit()
dst_conn.close()
