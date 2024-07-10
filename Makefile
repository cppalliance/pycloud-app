default:
	@echo "make init"
	@echo "make build"
	@echo "make format"
	@echo "make lock"

init: create-virtualenv
	.venv/bin/uv pip install -r requirements.txt

build: init
	.venv/bin/pyinstaller --onefile cli.py
	echo "Binary is in dist/cli"

format: init
	ruff format

create-virtualenv:
	@if [ ! -d .venv ]; then \
		python3 -m venv .venv; \
		.venv/bin/pip install uv; \
	fi

lock: init
	.venv/bin/uv pip compile requirements.in -o requirements.txt
