FROM ubuntu:24.04
ARG DEBIAN_FRONTEND=noninteractive
ENV DATA_DIRECTORY=/data \
  STEAM_DIRECTORY=/steam \
  ZOMBIE_DIRECTORY=/zomboid \
  RAM=8192M \
  TZ=Asia/Seoul \
  SERVER_NAME=pzserver \
  ADMIN_USERNAME=root \
  ADMIN_PASSWORD=changeme
RUN apt-get update -y && \
  apt-get install -y lib32gcc-s1 curl sudo jq && \
  mkdir -p /tmp
WORKDIR /tmp
COPY server .
RUN chmod +x server
EXPOSE 8766/udp 8767/udp 16261/udp 16262/udp
CMD ./server