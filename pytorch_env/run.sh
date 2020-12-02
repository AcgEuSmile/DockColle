if [ -d ${1} ] && [ $# -ne 0 ]; then
    docker run --gpus all -it -d -e="DISPLAY" \
        -v ${1}:/home/${USER}/project/ \
        -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --shm-size=32G \
        --name drone_env pytorch_env
else
    echo "${1} path not found!!"
fi