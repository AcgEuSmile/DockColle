# It's Docker instal guide.

## Uninstall old versions
Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
```bash
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```
## Install using the repository
SET UP THE REPOSITORY
1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```bash
$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

2. Add Docker’s official GPG key:

```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Check your key with the `fingerprint` command.

```bash
$ sudo apt-key fingerprint 0EBFCD88

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

3. Use the following command to set up the **stable** repository. To add the **nightly** or **test** repository, add the word `nightly` or `test` (or both) after the word `stable`

```bash
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

## INSTALL DOCKER ENGINE
1. Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version:

```bash
 $ sudo apt-get update
 $ sudo apt-get install docker-ce docker-ce-cli containerd.io
```
2. If you want to install specific version, do this! 

```bash
# List the versions available in your repo:
$ apt-cache madison docker-ce

  docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  ...
#  Install a specific version using the version string from the second column, for example, 5:18.09.1~3-0~ubuntu-xenial
$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
```

3. Verify that Docker Engine is installed correctly by running the hello-world image.

```bash
$ sudo docker run hello-world
```

## Using docker without sudo

### Explain, Why docker need sudo ?? 

> The Docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is owned by the user `root` and other users can only access it using `sudo`. The Docker daemon always runs as the `root` user.
> 
> If you don’t want to preface the `docker` command with sudo, create a Unix group called `docker` and add users to it. When the Docker daemon starts, it creates a Unix socket accessible by members of the `docker` group.

### How to do this ??

1. Check docker group exist or not.
```bash
$ cat /etc/group | grep docker
```
2. If it doesn't, creat with this command:
```bash
$ sudo groupadd docker
```
3. Add the current user to docker group
```bash
$ sudo gpasswd -a $USER docker
```
4. renew docker group setting
```bash
$ newgrp docker
```
5. Check docker group again
```bash
$ cat /etc/group | grep docker
```
