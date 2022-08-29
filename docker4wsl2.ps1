<#
.SYNOPSIS
A script to install and execute docker in a WSL2 virtual machine.

.DESCRIPTION
You must install a Linux WSL2 distro before (see https://docs.microsoft.com/en-us/windows/wsl/install).
You must configure the desired distro by setting the $DOCKER_DISTRO variable inside this script.
Currently only Ubuntu distro is supported (latest LTS is recommended).

.EXAMPLE
. docker4wsl2.ps1

Dot-Source functions in current running PowerShell.

.EXAMPLE
docker-install-ubuntu

Install the docker service and client inside an Ubuntu distro.

.EXAMPLE
docker run hello-world

Run a simple hello-world docker test.

.EXAMPLE
docker ps

List containers from PowerShell CLI.

.NOTES
You can add the functions of this scritp in yor shells by dot-sourcing in your profile:
$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

.LINK
Install a Linux WSL2 distro: https://docs.microsoft.com/windows/wsl/install

.LINK
About dot operator: https://ss64.com/ps/source.html
#>

$DOCKER_DISTRO = "Ubuntu-20.04"
$DOCKER_HOST = "tcp://0.0.0.0:2375"

# Use the following if you need to configure static IP addresses for WSL disto and the host
# start-process netsh -ArgumentList 'interface ip add address "vEthernet (WSL)" 192.168.168.1 255.255.255.0' -Verb runas
# wsl --distribution $DOCKER_DISTRO --user root ip addr add 192.168.168.2/24 broadcast 192.168.168.255 dev eth0 label eth0:1
# wsl --distribution $DOCKER_DISTRO --user root dockerd

# Install docker binaries in a Ubuntu WSL virtual machine from official repo
function docker-install-ubuntu {
    # Uninstall old versions
    wsl -d $DOCKER_DISTRO --user root -- apt -y remove docker docker-engine docker.io containerd runc

    # Update system
    wsl -d $DOCKER_DISTRO --user root -- apt -y update '&&' apt -y upgrade

    # Set up the repository
    wsl -d $DOCKER_DISTRO --user root -- apt -y install ca-certificates curl gnupg lsb-release

    # Add Docker's official GPG key
    wsl -d $DOCKER_DISTRO --user root -- mkdir -p /etc/apt/keyrings
    wsl -d $DOCKER_DISTRO --user root -- curl -fsSL https://download.docker.com/linux/ubuntu/gpg '|' gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    # Add source repository
    $apt_source_repo = "deb [arch=`$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu `$(lsb_release -cs) stable"
    wsl -d $DOCKER_DISTRO --user root -- echo $apt_source_repo '|' tee /etc/apt/sources.list.d/docker.list '>' /dev/null

    # Install Docker client and engine
    wsl -d $DOCKER_DISTRO --user root -- apt -y update
    wsl -d $DOCKER_DISTRO --user root -- apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

# Defines an alias to start the docker service from PowerShell command line
function dockerd {
    wsl --distribution $DOCKER_DISTRO --user root dockerd -H $DOCKER_HOST -H "unix:///var/run/docker.sock"
}

# Defines an alias to call the docker client from PowerShell command line
function docker {
    wsl -d $DOCKER_DISTRO docker -H $DOCKER_HOST @Args
}
