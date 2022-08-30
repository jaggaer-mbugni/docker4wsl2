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
Use the MS Terminal: https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701

## First setup

### 1. Install a WSL2 distro
An official Ubuntu LTS from MS Store is recommended:  
```shell
PS> wsl --install --distribution Ubuntu-20.04
```

See https://docs.microsoft.com/windows/wsl/install for more info.

### Edit the script to choose your distro
```shell
$DOCKER_DISTRO = "Ubuntu-20.04"
```

### 2. Source the docker4wsl2.ps1 script
Add docker commands in your current shell:  
```shell
PS> . .\docker4wsl2.ps1
```

#### TIPS
To avoid to run the script manually, you can source it in your profile.
First, check where your profile file is located:
```powershell
PS> $PROFILE.CurrentUserCurrentHost

# This is just an example path: check your command output
C:\MyUserProfilePath\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

Then add the line into the `Microsoft.PowerShell_profile.ps1` file that dot-source the script:  
```powershell
# Check the current path where the script is located
# The script will run every time PowerShell is launched
. "C:\MyScriptPath\docker4wsl2.ps1"
```

For more info about profiles visit:  
https://docs.microsoft.com/powershell/module/microsoft.powershell.core/about/about_profiles  


### 3. Install docker tools
Install docker from repo in your WSL2 distro:  
```shell
PS> docker-install-ubuntu
```

Test the docker service by running the following:
```shell
PS> dockerd
```

#### TIPS
Type Ctrl+C to gracefully stop the service.

Test the docker client:  
```shell
PS> docker version
PS> docker compose version
```

#### TIPS
You can test your installation using a simple container:  
```shell
PS> docker run hello-world
```

## Everyday use

### Ensure the script has run
See step 2 of the setup section.

### Run the docker service and see the logs
Open a terminal and run the `dockerd` command:
```shell
PS> dockerd
```

### Use the docker client
Open a terminal and run docker commands:  
```shell
PS> docker ps
PS> docker images
```

## Read the docs
You can get help from the script itself:  
```shell
PS> Get-Help .\docker4wsl2.ps1 -Full
```
