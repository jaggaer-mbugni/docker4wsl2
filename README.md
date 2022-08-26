# Docker4wsl2

## Purpose
A simple tool to setup docker in a WSL2 virtual machine

## HowTo

### Install a WSL2 distro
An official Ubuntu LTS from MS Store is recommended:

```shell
PS> wsl --install --distribution Ubuntu-20.04
```

### Edit the script to choose your distro

```shell
$DOCKER_DISTRO = "Ubuntu-20.04"
```

### Source the docker4wsl2.ps1 script
Add docker commands in your current shell:

```shell
PS> . .\docker4wsl2.ps1
```

### Install docker tools
Install docker from repo in your WSL2 distro.

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