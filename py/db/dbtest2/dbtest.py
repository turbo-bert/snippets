import sqlalchemy
import sqlalchemy.orm
import sqlalchemy.ext.automap
import os
import contextlib
import json

with contextlib.suppress(FileNotFoundError): os.unlink("test.sql")

def prerunsql(x):
    e = sqlalchemy.create_engine("sqlite:///test.sql")
    with e.connect() as c:
        c.exec_driver_sql(x)
        c.commit()
        c.close()

prerunsql("CREATE TABLE test(id INTEGER primary key, name text, name2 TEXT);")


src_engine = sqlalchemy.create_engine("sqlite:///test.sql")
Src_Base = sqlalchemy.ext.automap.automap_base()
src_session = sqlalchemy.orm.Session(src_engine)

Src_Base.prepare(autoload_with=src_engine)

t_test = Src_Base.classes.test

x = t_test(name="oink", id=None)
src_session.add(x)
src_session.commit()



#src_session.add(TABLE_artcl(title="bla", t=datetime.datetime.now(tz=datetime.timezone.utc)))
