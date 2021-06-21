FROM ubuntu:20.04

WORKDIR /tmp/

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y make vim zsh clang netcat curl git

# oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && echo 'export PS1="DOCK ${PS1}"' >> ~/.zshrc

ENTRYPOINT sleep infinity
