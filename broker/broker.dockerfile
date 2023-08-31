FROM golang:1.19-alpine AS builder

RUN mkdir /app

COPY . /app

WORKDIR /app

# CGO_ENABLED enable/disable c library usage for go build
RUN CGO_ENABLED=0 go build -o brokerAPP ./cmd/api

RUN chmod +x ./app/brokerAPP

# Build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# Only copies the binary file from the builder image
# into the new image
COPY --from=builder /app/brokerAPP /app

CMD [ "/app/brokerAPP" ]