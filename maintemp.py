from fastapi import FastAPI, Request,Body, HTTPException
import mysql.connector

conn = mysql.connector.connect(host = "localhost", port = '3307', user = 'root', password = "", database = 'login_management_db')


import re
 
# Make a regular expression
# for validating an Email
regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
 
# Define a function for
# for validating an Email
def check(email):
 
    # pass the regular expression
    # and the string into the fullmatch() method
    if(re.fullmatch(regex, email)):
        return True
 
    else:
        return False

app = FastAPI()

# class Item(BaseModel):
#     name: str
#     description: str | None = None
#     price: float
#     tax: float | None = None


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/register/")
async def register(username: str = Body(...), email: str = Body(...), password: str = Body(...)):
    print(username, email, password)
    # checking if email is valid
    if(not check(email)):
        raise HTTPException(status_code=400, detail="email invalid format")
    