FROM jrottenberg/ffmpeg:4.1-ubuntu1804

WORKDIR /rtsp/

RUN apt install -y curl

RUN curl -L -o rtsp-simple-server_v0.19.3_linux_amd64.tar.gz https://github.com/aler9/rtsp-simple-server/releases/download/v0.19.3/rtsp-simple-server_v0.19.3_linux_amd64.tar.gz
RUN tar -xvzf rtsp-simple-server_v0.19.3_linux_amd64.tar.gz

COPY ./rtsp-simple-server.yml ./rtsp-simple-server.yml

ENTRYPOINT ["./rtsp-simple-server"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]
#ffmpeg -re -stream_loop -1 -i /video/${VIDEO_FILE} -c copy -f rtsp rtsp://localhost:8554/stream