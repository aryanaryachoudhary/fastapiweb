from fastapi import FastAPI, Depends, HTTPException,Request
from fastapi.security import APIKeyHeader
from fastapi.responses import JSONResponse
from datetime import datetime, timedelta
import uvicorn
import secrets
import mysql.connector
import os
import base64
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
from Crypto.Util.Padding import unpad
import base64
import string
import random

def get_db_connection():
    conn = mysql.connector.connect(
        host="localhost",
        port='3307',
        user="root",
        password="",
        database="login_management_db"
    )
    return conn

def generate_random_string(length):
    letters = string.ascii_letters
    random_string = ''.join(random.choice(letters) for i in range(length))
    random_string = base64Encoding(random_string.encode("ascii"))
    return random_string

def base64Encoding(input):
  print(input)
  dataBase64 = base64.b64encode(input)
  print(dataBase64)
  dataBase64P = dataBase64.decode("UTF-8")
  print(dataBase64P)
  return dataBase64P

def base64Decoding(input):
    print(input)
    print(base64.decodebytes(input.encode("ascii")))
    return base64.decodebytes(input.encode("ascii"))
   

def generate_master_key():
    my_key_file = "key"
    if os.path.exists(my_key_file):
        with open(my_key_file, 'r') as myfile:
            file_size = os.path.getsize(my_key_file)
            master_key = myfile.read(file_size)
            print(master_key)
            
    else:
        letters = string.ascii_letters
        master_key = ''.join(random.choice(letters) for i in range(16))
        master_key = base64Encoding(master_key.encode("ascii"))
        with open(my_key_file, 'w') as myfile:
            myfile.write(master_key)
    return master_key

encryptionKey = base64Decoding(generate_master_key())

def encrypt_key( plaintext):
  cipher = AES.new(encryptionKey, AES.MODE_ECB)
  ciphertext = cipher.encrypt(pad(plaintext.encode("ascii"), AES.block_size))
  return base64Encoding(ciphertext)

app = FastAPI()
sessions = {}

API_KEY_NAME = "api_key"
api_key_header = APIKeyHeader(name=API_KEY_NAME)

# def decrypt_key(encrypted_key: str):
#     print(encrypted_key)
#     dec = cipher_suite.encrypt(encrypted_key.strip().encode()).decode()
#     print(dec)
#     return dec 

def get_api_key(api_key: str = Depends(api_key_header)):
    print(api_key)
    api_key = encrypt_key(api_key)
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM user WHERE api_key=%s", (api_key,))
    user = cursor.fetchone()
    if not user:
        raise HTTPException(status_code=400, detail="User does not exist")
    if user[5] < datetime.now():
        raise HTTPException(status_code=402, detail="Key expired")
    return api_key

@app.post("/register")
def register(username: str, email: str):
    api_key = secrets.token_hex(5)
    encrypted_key = encrypt_key(api_key)
    expiry_date = datetime.now() + timedelta(days=365)
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO user (username, email, api_key, createdon, validtill) VALUES (%s, %s, %s, %s, %s)", (username, email, encrypted_key, datetime.now(), expiry_date))
    conn.commit()
    return {"api_key": api_key}

@app.get("/user/authenticate")
def authenticate(api_key: str = Depends(get_api_key)):
    session_id = secrets.token_hex(16)
    sessions[session_id] = api_key
    response = JSONResponse(content={"status": "success"})
    response.set_cookie(key="session_id", value=session_id)
    return response

@app.get("/getUserData")
def get_user_data(request: Request):
    print(sessions)
    session_id = request.cookies.get("session_id")
    print(session_id)
    if session_id not in sessions:
        raise HTTPException(status_code=401, detail="Not authenticated")
    api_key = sessions[session_id]
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM user WHERE api_key=%s", (api_key,))
    user_data = cursor.fetchone()
    return {"username": user_data[1], "email": user_data[2]}

if __name__ == "__main__":
    uvicorn.run("main:app", log_level="debug")
