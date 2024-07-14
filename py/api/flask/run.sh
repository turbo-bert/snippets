#!/bin/bash

export SQLALCHEMY_DATABASE_URI="mysql+pymysql://root:foo123@127.0.0.1:33060/test"

vp main-sqla.py
