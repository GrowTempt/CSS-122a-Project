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
   print("hello World")

if __name__ == "__main__":
    main()