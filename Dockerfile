FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --assume-yes update && apt-get --assume-yes install apt-transport-https ca-certificates gnupg

ADD https://packages.microsoft.com/keys/microsoft.asc microsoft.asc

RUN apt-key add microsoft.asc

RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt-get --assume-yes update && apt-get --assume-yes install code libgtk2.0-0 libxss1 libasound2

ENTRYPOINT code --user-data-dir="/root/.config/Code" && sleep infinity
