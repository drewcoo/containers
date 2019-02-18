@echo off

for /f "usebackq delims= " %%i in (`docker container list`) do (
  if "%%i" neq "CONTAINER" (
    echo docker stop %%i
    docker stop %%i >nul
  )
)
echo all stopped
