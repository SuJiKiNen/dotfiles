FROM ubuntu:18.04
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
ARG USER=SuJiKiNen
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y --no-install-recommends sudo
RUN apt-get install -y --no-install-recommends git
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends python3
RUN apt-get install -y --no-install-recommends wget
RUN apt-get install -y --no-install-recommends curl
RUN rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --force-badname --gecos '' ${USER}
RUN adduser ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME=/home/${USER}
USER ${USER}
WORKDIR ${HOME}
COPY --chown=SuJiKiNen:SuJiKiNen . ${HOME}/dotfiles
COPY --chown=root:root . /root/dotfiles
RUN cd ${HOME}/dotfiles && ./install
