# Install Nvidia-docker 2


## Install command
```bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
```
## How to use?
### Method 1
Using `--runtime=nvidia`
```bash
docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi
```
### Method 2
Add in default config
```bash
sudo vim /etc/docker/daemon.json
# set default-runtime
"default-runtime": "nvidia",
"runtimes": {
    "nvidia": {
        "path": "nvidia-container-runtime",
        "runtimeArgs": []
    }
}
```