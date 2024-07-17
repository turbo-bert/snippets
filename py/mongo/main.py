# using ~/venv/bin/python


import pymongo
import bson
import sys

client = pymongo.MongoClient("mongodb://root:foo123@localhost:27017")


mydb = client.mydb

#print(client.admin.command({"updateUser": "root", "pwd": "foo123"}))

sys.exit(0)


#mycoll = mydb.create_collection("mycollection")
mycoll = mydb.mycollection

for i in range(1,100):
    x = mycoll.insert_one({"strange": "thing", "other": "w0458vz"})
    print(x)

# print(client.list_database_names())
#print(mycoll.count_documents({}))

# for x in mycoll.find():
#     print(x["strange"])
