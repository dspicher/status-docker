FROM golang:1.14


RUN apt-get update -q && \
    apt-get install -qy git

RUN git clone https://github.com/dspicher/status-go

WORKDIR status-go
RUN make statusgo

CMD ./build/bin/statusd -c ./_examples/whisper.json

