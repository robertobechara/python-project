import uvicorn

from fastapi import FastAPI
from fastapi.responses import HTMLResponse

from src.models.user import User
from src.user.main import execute

app = FastAPI()


@app.get("/")
def home():
    return {"health": "ok"}


@app.post("/user", response_class=HTMLResponse)
def user(input_user: User):
    return execute(input_user)


def main():
    uvicorn.run(app)


if __name__ == "__main__":
    main()
