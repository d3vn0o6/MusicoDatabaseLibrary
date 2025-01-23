import sqlite3 as conn
from sqlite3 import Cursor as curs

def connection(DB_FILE):
    return conn.connect(DB_FILE)
    


def create_db(**req):
    try:
        curs.execute(**req)
        conn.commit()
    except sqlite3Error as sqlerr:
        print(f'Sqlite Error: {sqlerr}')
        conn.rollback()
    finally:
    if conn:
        conn.close()

def 
        


        
        