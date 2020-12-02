docker build --rm -t pytorch_env \
    --build-arg USER_ID=$(id -u) \
    --build-arg GROUP_ID=$(id -g) \
    --build-arg USER=${USERNAME} .