
cinst vcredist2013
cinst vcredist140

cinst visualstudio2019community -package-parameters "--config $((Get-Location).Path + '\vsconfig')"

.\vs_community__1990310475.1591058169.exe --passive `
  --add Microsoft.VisualStudio.Product.Community `
  --add Microsoft.VisualStudio.Component.VC.CoreIde `
  --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64
