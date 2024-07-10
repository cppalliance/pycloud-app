import uvicorn

from constants import PORT, HOST
from .app import app


def run_server():
    try:
        uvicorn.run(app, host=HOST, port=PORT)
    except KeyboardInterrupt:
        print("Server shutting down.")


if __name__ == "__main__":
    run_server()
