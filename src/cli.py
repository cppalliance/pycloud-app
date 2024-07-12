import sys
import requests

from constants import HOST, PORT


def fetch_message_from_api():
    r = requests.get(f"http://{HOST}:{PORT}/")
    data = r.json()

    return data["message"]


def main():
    message = fetch_message_from_api()
    print(f"Message: { message!r }")

    print()

    sys.exit(0)


if __name__ == "__main__":
    main()
