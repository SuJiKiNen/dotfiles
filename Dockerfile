FROM ubuntu:18.04
ENV TZ Asia/Shanghai
ARG DEBIAN_FRONTEND=noninteractive
ARG USER=SuJiKiNen
RUN adduser --disabled-password --force-badname --gecos '' ${USER}
RUN adduser ${USER} sudo
RUN apt-get update
RUN apt-get install -y --no-install-recommends git
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends python3
RUN apt-get install -y --no-install-recommends wget
RUN apt-get install -y --no-install-recommends curl
RUN rm -rf /var/lib/apt/lists/*
ENV HOME=/home/${USER}
USER ${USER}
WORKDIR ${HOME}
COPY --chown=SuJiKiNen:SuJiKiNen . ${HOME}/dotfiles
