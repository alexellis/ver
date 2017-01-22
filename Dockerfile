FROM golang:1.7
COPY . /go/src/github.com/alexellis/ver
WORKDIR /go/src/github.com/alexellis/ver
RUN go get -d -v
RUN go install -v

ADD https://github.com/alexellis/faas/releases/download/v0.1-alpha/fwatchdog /usr/bin/
RUN chmod +x /usr/bin/fwatchdog
ENV fprocess="/go/src/app/app"  
CMD ["fwatchdog"]  
