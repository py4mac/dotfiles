FROM ubuntu:20.04

# variables
ENV USER=dev
ENV USER_ID=1000
ENV PASSWORD=docker
ENV WORKSPACE=/home/$USER/workspace

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install \
    --no-install-recommends -y \
    sudo

# add a user
RUN useradd -u $USER_ID -ms /bin/bash $USER && \
    echo "$USER:$PASSWORD" | chpasswd && adduser $USER sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers
USER $USER

# Copy dotfiles
COPY . /tmp/.dotfiles

# set workdir
WORKDIR /tmp/.dotfiles

# Install dotfiles (container option)
RUN ./bin/dot-bootstrap venv

# set workdir
WORKDIR $WORKSPACE

# setup ssh
RUN mkdir -p /home/$USER/.ssh && ln -s /run/secrets/user_ssh_key /home/$USER/.ssh/id_rsa
RUN chown -R $USER:$USER /home/$USER/.ssh
RUN echo "Host *.trabe.io\n\tStrictHostKeyChecking no\n" >> /home/$USER/.ssh/config

# start zsh
ENTRYPOINT [ "/bin/zsh" ]
