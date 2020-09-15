# Reference
[https://docs.nvidia.com/](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/running.html)

# Build docker image
```bash
$ docker build --rm -t pytorch_env \
--build-arg USER_ID=$(id -u) \
--build-arg GROUP_ID=$(id -g) \
--build-arg USER=${USERNAME} .
```

# Run docker container
Normal using
```bash
$ docker run --gpus all -it -d \
    -v ~/DB/ccy/DroneRF:/home/chu/project/ \
    --name dl_vscode  pytorch_env
```
Display image to local machine.
```bash
$ docker run --gpus all -it -d -e="DISPLAY" \
    -v ~/DB/ccy/DroneRF:/home/chu/project/ \
    -v="/etc/group:/etc/group:ro" \
    -v="/etc/passwd:/etc/passwd:ro" \
    -v="/etc/shadow:/etc/shadow:ro" \
    -v="/etc/sudoers.d:/etc/sudoers.d:ro" \
    -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --shm-size=32G \
    --name drone_env pytorch_env
```
