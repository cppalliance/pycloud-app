"""launcher.py. Launches the application.

This module is the application entry point. It is responsible for setting up the
web application and launching the cli afterwards.
"""

import time

import background

from cli import main as cli_main
from api.server import run_server


@background.task
def launch_web_server():
    run_server()


def main():
    print("Launching web server...")
    launch_web_server()

    print("Visit http://localhost:5042/docs to view the interactive API Documentation.")
    print("Ctrl+C to exit.")
    print("--")
    print()

    print("Launching CLI...")
    # Wait for the web server to start up.
    time.sleep(1)
    # Launch the CLI.
    cli_main()


if __name__ == "__main__":
    main()
