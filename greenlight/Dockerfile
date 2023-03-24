FROM golang:latest

RUN go install github.com/githubnemo/CompileDaemon@latest

COPY . /usr/src/app
WORKDIR /usr/src/app

CMD CompileDaemon -build="go build -o bin/greenlight ./cmd/api/" -command="./bin/greenlight" -exclude-dir=".git"