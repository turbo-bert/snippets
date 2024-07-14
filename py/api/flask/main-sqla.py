from typing import Optional

from flask import Flask, jsonify, request, make_response, url_for, redirect, render_template
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Mapped, mapped_column
import sqlalchemy

import json
import os
import sys
import time
import datetime


if 'SQLALCHEMY_DATABASE_URI' not in os.environ.keys():
    print('SQLALCHEMY_DATABASE_URI not set as ENV')
    sys.exit(1)



class Base(DeclarativeBase):
    pass

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ['SQLALCHEMY_DATABASE_URI']


db = SQLAlchemy(model_class=Base)

class my_table(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    col_a: Mapped[str] = mapped_column(sqlalchemy.String(80), unique=True)
    col_b: Mapped[Optional[int]] = mapped_column(sqlalchemy.Integer)
    s80: Mapped[Optional[str]] = mapped_column(sqlalchemy.String(80))
    t: Mapped[Optional[datetime.datetime]] = mapped_column(sqlalchemy.DateTime)


db.init_app(app)


with app.app_context() as ac:
    db.drop_all()
    db.create_all()


@app.route('/', methods=['GET', 'POST'])
def X():
    x = my_table()
    x.col_a = str(time.time())
    x.t = datetime.datetime.now(datetime.UTC)
    db.session.add(x)
    db.session.commit()
    return(jsonify({"hello":"world", "x": x.id, "t": x.t}))


@app.route('/info', methods=['GET', 'POST'])
def info():
    return(render_template("info.html"))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
