FROM golang:1.12

# Create app directory
WORKDIR /root

COPY . .

RUN go build
