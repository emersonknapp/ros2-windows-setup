# ROS 2 Windows Setup

Automated setup for a Windows ROS2 development environment.


## Notes

Used EC2 AMI `ami-051050786c3fdf217` "Windows Server 2019 with Containers"

Open Powershell terminal

```
START https://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/emersonknapp/ros2-windows-setup/master/boxstarter/ros2-core.ps1

```

The first time you run, it will prompt you to add boxstarter.org to the trusted list. Press "add" a few times, then re-run the powershell command


```
.\vs_community__1990310475.1591058169.exe --passive `
  --add Microsoft.VisualStudio.Product.Community `
  --add Microsoft.VisualStudio.Component.VC.CoreIde `
  --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64
```
