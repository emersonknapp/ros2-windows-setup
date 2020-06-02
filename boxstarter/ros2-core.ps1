Update-ExecutionPolicy Unrestricted

# Enables TLS 1.2 for curl (HTTP connection would fail without this)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

cinst python --version 3.8.3
cinst vcredist2013
cinst vcredist140

cinst visualstudio2019community -package-parameters "--config $((Get-Location).Path + '\vsconfig')"

cinst cmake

New-Item -ItemType Directory -Force -Path \dev\ros2\tmp
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/asio.1.12.1.nupkg -o \dev\ros2\tmp\asio.1.12.1.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/cunit.2.1.3.nupkg -o \dev\ros2\tmp\cunit.2.1.3.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/eigen.3.3.4.nupkg -o \dev\ros2\tmp\eigen.3.3.4.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/log4cxx.0.10.0.nupkg -o \dev\ros2\tmp\log4cxx.0.10.0.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/tinyxml-usestl.2.6.2.nupkg -o \dev\ros2\tmp\tinyxml-usestl.2.6.2.nupkg
curl https://github.com/ros2/choco-packages/releases/download/2020-02-24/tinyxml2.6.0.0.nupkg -o \dev\ros2\tmp\tinyxml2.6.0.0.nupkg

cinst -s \dev\ros2\tmp `
  asio `
  cunit `
  eigen `
  log4cxx `
  tinyxml-usestl `
  tinyxml2
