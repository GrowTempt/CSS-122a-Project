import db_functions

from dotenv import load_dotenv
import os
import mysql.connector
import sys

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

def main():
   return

if __name__ == "__main__":
    main()

    args = sys.argv[2:]

    db_functions.insertAgentClient(*args)
    db_functions.deleteBaseModel(*args)
