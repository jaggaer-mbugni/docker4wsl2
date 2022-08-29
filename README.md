# Docker4wsl2

## Purpose
A simple tool to setup docker in a WSL2 virtual machine

## Before to start
Ensure you can run local scripts:  
```shell
PS> Get-ExecutionPolicy
RemoteSigned
```

If you aren't enabled allow running local scripts by running the following command as administrator: 
```shell
PS> Set-ExecutionPolicy RemoteSigned
```

#### TIPS
Use the MS Terminal: https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701:

## HowTo

### Install a WSL2 distro
An official Ubuntu LTS from MS Store is recommended:  
```shell
PS> wsl --install --distribution Ubuntu-20.04
```

See https://docs.microsoft.com/windows/wsl/install for more info.

### Edit the script to choose your distro
```shell
$DOCKER_DISTRO = "Ubuntu-20.04"
```

### Source the docker4wsl2.ps1 script
Add docker commands in your current shell:  
```shell
PS> . .\docker4wsl2.ps1
```

#### TIPS
To avoid to run the script manually, you can source it in your profile, see:  
https://docs.microsoft.com/powershell/module/microsoft.powershell.core/about/about_profiles  

### Install docker tools
Install docker from repo in your WSL2 distro:  
```shell
PS> docker-install-ubuntu
```

### Run the docker service and see the logs
```shell
PS> dockerd
```

### Test your docker installation
Run docker client from PowerShell:  
```shell
PS> docker version
PS> docker run hello-world
```

### Read the docs
You can get help from the script itself:  
```shell
PS> Get-Help .\docker4wsl2.ps1 -Full
```
