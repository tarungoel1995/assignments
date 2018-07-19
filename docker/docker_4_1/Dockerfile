FROM alpine
MAINTAINER Tarun goel
RUN apk update -y
RUN apk add nodejs
RUN mkdir -p /app
RUN mkdir -p /tarun
COPY index.js /app
WORKDIR /app
CMD node index.js

