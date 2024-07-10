import fastapi

from .constants import DEBUG

app = fastapi.FastAPI()


@app.get("/")
def read_root():
    return {"message": "Hello, World"}
