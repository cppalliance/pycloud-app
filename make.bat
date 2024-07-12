@echo off

if "%1"=="" goto default
if "%1"=="init" goto init
if "%1"=="build" goto build
if "%1"=="exe" goto exe
if "%1"=="server" goto server
if "%1"=="cli" goto cli
if "%1"=="format" goto format
if "%1"=="clean" goto clean
if "%1"=="create-virtualenv" goto create-virtualenv
if "%1"=="lock" goto lock

:default
echo make init
echo make build
echo make exe
echo make server
echo make format
echo make lock
goto :eof

:init
call :create-virtualenv
.venv\Scripts\uv pip install -r requirements.txt
goto :eof

:build
call :init
.venv\Scripts\pyinstaller --onefile src\launcher.py
echo Binary is in dist\launcher
goto :eof

:exe
call :build
dist\launcher.exe
goto :eof

:server
call :init
.venv\Scripts\python src\launcher.py
goto :eof

:cli
call :init
.venv\Scripts\python src\cli.py
goto :eof

:format
call :init
ruff format
goto :eof

:clean
if exist .venv rmdir /s /q .venv
if exist dist rmdir /s /q dist
if exist build rmdir /s /q build
goto :eof

:create-virtualenv
if not exist .venv (
    python -m venv .venv
    .venv\Scripts\pip install uv
)
goto :eof

:lock
call :init
.venv\Scripts\uv pip compile requirements.in -o requirements.txt
goto :eof
