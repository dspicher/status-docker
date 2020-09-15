FROM ubuntu:20.04

ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -q && \
    apt-get install -qy make git golang

RUN git clone https://github.com/dspicher/status-go

WORKDIR status-go
RUN make statusgo

ENTRYPOINT ./build/bin/statusd -c ./_examples/whisper.json

