from pymongo import MongoClient

client = MongoClient('mongodb://mongodb:27017/')

db = client.live_streaming
fs = gridfs.GridFS(db)

print('This is for testing purpose');