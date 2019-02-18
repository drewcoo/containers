FROM microsoft/windowsservercore

LABEL maintainer="drewcoo@gmail.com"

ARG TEMP_DIR=C:\\Users\\ContainerAdministrator\\AppData\\Local\\Temp

COPY install/ $TEMP_DIR

RUN powershell "%TEMP_DIR%\install_chocolatey.ps1"
RUN choco install --use-package-codes -y wixtoolset --version=3.10.3.300702 && (echo success: %errorlevel%) || (echo failure: %errorlevel%)
RUN choco install -v -y "%TEMP_DIR%\chocolatey.config"
RUN setx /M PATH "C:\\Program Files\\CMake\\bin;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Professional\\MSBuild\\15.0\\Bin;C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Professional\\VC\\Auxiliary\\Build;C:\\Program Files (x86)\\WiX Toolset v3.10\\bin;%PATH%"
RUN where heat.exe
