from dotenv import load_dotenv
import os
import mysql.connector

load_dotenv()

HOST = os.getenv("HOST")
USERNAME = os.getenv("USERNAME")
PASSWORD = os.getenv("PASSWORD")
DATABASE = os.getenv("DATABASE")

mydb = mysql.connector.connect(
  host=HOST,
  user=USERNAME,
  password=PASSWORD,
  database=DATABASE
)

def insertAgentClient(uid:int, username:str, email:str, card_number:int, card_holder:str, expiration_date:str, cvv:int, zip:int, interests:str):
    # convert string arguments from command line into correct datatypes
    uid = int(uid)
    card_number = int(card_number)
    cvv = int(cvv)
    zip = int(zip)

    # insert agent client
    cursor = mydb.cursor()

    # first put uid, email, and username into user
    query = """
            INSERT IGNORE INTO User (uid, email, username) 
            VALUES (%s, %s, %s)
            """
    values = (uid, email, username)

    cursor.execute(query, values)
    mydb.commit()

    query = """
            INSERT IGNORE INTO AgentClient (uid, interests, cardholder, expire, cardno, cvv, zip) 
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
    values = (uid, interests, card_holder, expiration_date,card_number, cvv, zip)   
    
    cursor.execute(query, values)
    mydb.commit()
    
    return

def deleteBaseModel(bmid:int):
    # delete base model from table
    uid = int(uid)

    cursor = mydb.cursor

    query = """
            DELETE FROM BaseModel WHERE bmid = (bmid)
            VALUES (%s)
            """
    values = (bmid)

    cursor.execute(query,values)
    mydb.commit()
    
    return