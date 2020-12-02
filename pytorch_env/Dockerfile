From nvcr.io/nvidia/pytorch:20.08-py3

COPY requirements.txt /opt/app/requirements.txt
ENV TERM=xterm-256color
ARG DEBIAN_FRONTEND=noninteractive
ARG APT_INSTALL="sudo python3-tk python3-pil"
ARG USER_ID
ARG GROUP_ID
ARG USER=c95ccy_docker
ARG PW=c95ccy_docker


RUN addgroup --gid $GROUP_ID ${USER}&& \
    adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID ${USER}&& \
    usermod -aG sudo ${USER}&& \
    echo "${USER}:${PW}" | chpasswd && \
    if [ "${APT_INSTALL}" = "" ]; then echo "No apt install";\
    else apt-get update ; apt-get install -y ${APT_INSTALL} ; fi && \
    pip3 install -r /opt/app/requirements.txt && \
    echo 'PS1="🐳  \[\033[1;36m\]\h \[\033[1;34m\]\w\[\033[0;35m\] \[\033[1;36m\]# \[\033[0m\]"' \
    >> /home/${USER}/.bashrc && \
    rm /usr/bin/python3 && \
    sudo ln -s /opt/conda/bin/python3.6 /usr/bin/python3

USER ${USER}
WORKDIR /home/${USER}/project