# Build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# Only copies the binary file from the builder image
# into the new image
COPY authApp /app

CMD [ "/app/authApp" ]