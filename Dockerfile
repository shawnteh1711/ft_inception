FROM golang:1.18-alpine
 
WORKDIR /app

RUN go mod init
COPY go.mod ./
COPY *.go ./
 
RUN go build -o /hello-world
RUN apk update
RUN apk add make # install make
 
CMD ["/hello-world"]