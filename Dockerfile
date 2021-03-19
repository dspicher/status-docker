FROM golang:1.15

RUN apt-get update -q && \
    apt-get install -qy git

RUN git clone https://github.com/status-im/status-go

WORKDIR status-go
COPY whisper_config.json .
RUN make statusgo

CMD ./build/bin/statusd -c whisper_config.json
