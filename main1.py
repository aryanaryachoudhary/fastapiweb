from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import APIKeyHeader
from fastapi.responses import JSONResponse
from datetime import datetime, timedelta
import uvicorn
import secrets
import hashlib
import mysql.connector

app = FastAPI()
sessions = {}

API_KEY_NAME = "api_key"
api_key_header = APIKeyHeader(name=API_KEY_NAME)

def get_db_connection():
    conn = mysql.connector.connect(
        host="localhost",
        port = '3307',
        user="root",
        password="",
        database="login_management_db"
    )
    return conn

def encrypt_key(key: str):
    return hashlib.sha256(key.encode()).hexdigest()

def get_api_key(api_key: str = Depends(api_key_header)):
    print(api_key)
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
def get_user_data(session_id: str = Depends(lambda: Depends(lambda x: x.cookies.get("session_id")))):
    if session_id not in sessions:
        raise HTTPException(status_code=401, detail="Not authenticated")
    api_key = sessions[session_id]
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM user WHERE api_key=%s", (api_key,))
    user_data = cursor.fetchone()
    return {"username": user_data[1], "email": user_data[2]}

if __name__ == "__main__":
    uvicorn.run("main:app", reload=True, log_level="debug")