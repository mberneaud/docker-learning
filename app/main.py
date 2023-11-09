from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Malte's API says": "Hello from the cloud!"}
