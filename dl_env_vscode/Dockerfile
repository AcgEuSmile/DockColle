From tensorflow/tensorflow:1.14.0-gpu-py3

COPY requirements.txt /opt/app/requirements.txt
ENV TERM=xterm-256color
#ARG APT_INSTALL="python3-tk"
ARG APT_INSTALL="sudo"
ARG USER_ID
ARG GROUP_ID
ARG USER
ARG PW=ccy123456

RUN   rm /etc/bash.bashrc && \
      addgroup --gid $GROUP_ID user && \
      if [ ${APT_INSTALL} = "" ]; then echo "No apt install";\
      else apt update ; apt install -y ${APT_INSTALL} ; fi && \
      useradd -m ${USER} --uid=${USER_ID} --gid=${GROUP_ID} && \
      usermod -aG sudo ${USER}&& \
      pip3 install -r /opt/app/requirements.txt && \
      echo "root:${PW}" | chpasswd && \
      echo "${USER}:${PW}" | chpasswd && \
      echo 'PS1="🐳  \[\033[1;36m\]\h \[\033[1;34m\]\w\[\033[0;35m\] \[\033[1;36m\]# \[\033[0m\]"' >> /home/${USER}/.bashrc


USER ${USER_ID}:${GROUP_ID}
