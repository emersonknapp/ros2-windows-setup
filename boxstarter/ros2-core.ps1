Update-ExecutionPolicy Unrestricted

# Enables TLS 1.2 for curl (HTTP connection would fail without this)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

cinst python --version 3.8.3
cinst vcredist2013
cinst vcredist140

cinst visualstudio2019community -package-parameters "--config $((Get-Location).Path + '\vsconfig')"
