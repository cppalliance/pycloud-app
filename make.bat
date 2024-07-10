@echo off

REM Equivalent of "default" target in Makefile
:default
echo make init
echo make build
echo make format
echo make lock
goto :eof

:init
call :create-virtualenv
call .venv\Scripts\uv pip install -r requirements.txt
goto :eof

:build
call :init
call .venv\Scripts\pyinstaller --onefile src/launcher.py
echo "Executable is in dist folder"
goto :eof

:format
call :init
call ruff format
goto :eof

:create-virtualenv
if not exist .venv (
    python -m venv .venv
    call .venv\Scripts\pip install uv
)
goto :eof

:lock
call :init
call .venv\Scripts\uv pip compile requirements.in -o requirements.txt
goto :eof
