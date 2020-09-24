FROM golang:1.15

RUN apt-get update -q && \
    apt-get install -qy git

RUN git clone https://github.com/status-im/status-go

WORKDIR status-go
RUN make statusgo

RUN sed -i 's/localhost/0.0.0.0/'  _examples/whisper.json

CMD ./build/bin/statusd -c _examples/whisper.json
