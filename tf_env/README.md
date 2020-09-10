# Build docker image
```bash
$ docker build --rm -t dl_env_vscode \
--build-arg USER_ID=$(id -u) \
--build-arg GROUP_ID=$(id -g) \
--build-arg USER=${USERNAME} .
```

# Run docker container
Normal using
```bash
$ docker run -it -d --name dl_vscode  dl_env_vscode
```
Display image to local machine.
```bash
$ docker run -it -d -e="DISPLAY" \
    -v ~/DB/ccy/DroneRF/AR\ drone/:/home/chu/project/ \
    -v="/etc/group:/etc/group:ro" \
    -v="/etc/passwd:/etc/passwd:ro" \
    -v="/etc/shadow:/etc/shadow:ro" \
    -v="/etc/sudoers.d:/etc/sudoers.d:ro" \
    -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name drone_env  dl_env_vscode
```

# Set vscode

1. Install extension: Remote-Conainers 

![step1](./pics/1.png)

2. Click the arrow at bottom left

![step2](./pics/2.png)

3. Select Remote-Containers: Attach to Running Container...

![step3](./pics/3.png)

4. Select the container you want to use.

![step4](./pics/4.png)

