# Installs all dependencies necessary to run a build of ROS2, but not to build it

Update-ExecutionPolicy Unrestricted

# Enables TLS 1.2 for curl (HTTP connection would fail without this)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Create a location to put dependency installers
set DEPS=\dev\ros2\dependencies
New-Item -ItemType Directory -Force -Path %DEPS%

cinst vcredist2013
cinst vcredist140

cinst python --version 3.8.3

# Install OpenSSL
curl https://slproweb.com/download/Win64OpenSSL-1_1_1g.exe -o %DEPS%\Win64OpenSSL-1_1_1g.exe
%DEPS%\Win64OpenSSL-1_1_1g.exe /s /q
setx -m OPENSSL_CONF C:\OpenSSL-Win64\bin\openssl.cfg
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\OpenSSL-Win64\bin", "Machine")

# Install visual studio with necessary components
cinst visualstudio2019community --package-parameters " `
  --passive `
  --add Microsoft.VisualStudio.Product.Community `
  --add Microsoft.VisualStudio.Component.VC.CoreIde `
  --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
  --add Microsoft.VisualStudio.Component.Windows10SDK.16299 `
  --includeRecommended `
  --locale en-US"

cinst cmake --installargs 'ADD_CMAKE_TO_PATH=System'

# Get and install OSRF custom non-contributed choco packages
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/asio.1.12.1.nupkg          -o %DEPS%\asio.1.12.1.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/cunit.2.1.3.nupkg          -o %DEPS%\cunit.2.1.3.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/eigen.3.3.4.nupkg          -o %DEPS%\eigen.3.3.4.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/log4cxx.0.10.0.nupkg       -o %DEPS%\log4cxx.0.10.0.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/tinyxml-usestl.2.6.2.nupkg -o %DEPS%\tinyxml-usestl.2.6.2.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/tinyxml2.6.0.0.nupkg       -o %DEPS%\tinyxml2.6.0.0.nupkg

cinst -s %DEPS% `
  asio `
  cunit `
  eigen `
  log4cxx `
  tinyxml-usestl `
  tinyxml2

# Basic python tools
py -m pip install -U pip wheel setuptools

# ROS2 python runtime dependencies
py -m pip install -U `
  catkin_pkg `
  cryptography `
  empy `
  ifcfg `
  lark-parser `
  lxml `
  netifaces `
  numpy `
  opencv-python `
  pyparsing `
  pyyaml
