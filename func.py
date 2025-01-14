import sqlite3 as db

# Connect to Sqlite database 
class Database:
  def __init__(self):
    self.data_file = "database.db"
    self.connect()
    self.cursor()
    
  def connect(self):
    return db.connect(self.data_file)
    
  def cursor(self):
    return self.connect().cursor()
    
    
  
         
  
    

