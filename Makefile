default:
	@echo "make init"
	@echo "make build"
	@echo "make exe"
	@echo "make server"
	@echo "make format"
	@echo "make lock"

init: create-virtualenv
	.venv/bin/uv pip install -r requirements.txt

build: init
	.venv/bin/pyinstaller --onefile src/launcher.py
	echo "Binary is in dist/launcher"

exe: build
	./dist/launcher

server: init
	.venv/bin/python src/launcher.py

cli: init
	.venv/bin/python src/cli.py

format: init
	ruff format

clean:
	rm -rf .venv dist build

create-virtualenv:
	@if [ ! -d .venv ]; then \
		python3 -m venv .venv; \
		.venv/bin/pip install uv; \
	fi

lock: init
	.venv/bin/uv pip compile requirements.in -o requirements.txt
